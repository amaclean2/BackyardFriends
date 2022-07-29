import { Router } from 'express';
import { validationResult } from 'express-validator';
import { createTick } from '../../DB';
import { returnError } from '../../ErrorHandling';
import { CREATED } from '../../ErrorHandling/statuses';
import { buildUserObject } from '../../Handlers/Users';
import { tickCreateValidator } from '../../Validators/TickValidators';

const router = Router();

router.post('/create', tickCreateValidator(), async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        console.log('ERRORS', errors);
        return returnError({ req, res, error: errors.array()[0] });
    }

    try {
        const { user_id, adventure_id, public: publicField } = req.body;

        await createTick({ user_id, adventure_id, public: publicField });

        const newUserObj = await buildUserObject({ id: user_id });
        delete newUserObj.password;

        res.status(CREATED).json({
            data: {
                user: newUserObj
            }
        });

    } catch (error) {
        throw returnError({ req, res, message: 'serverCreateTick', error });
    }
});

export default router;