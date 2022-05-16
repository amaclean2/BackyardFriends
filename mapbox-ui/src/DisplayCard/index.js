import CarretIcon from '../Images/CarretIcon';
import { useCardStateContext } from '../Providers/cardStateProvider';

import './styles.css';

const DisplayCard = ({ children, onClose = () => {} }) => {
	const { displayCardBoolState, displayCardOpenState, closeCard } = useCardStateContext();

	if (!displayCardBoolState) {
		return null;
	}

	const localOnClose = (e) => {
		onClose(e);
		closeCard();
	}

	return (
		<div className={`display-card ${displayCardOpenState}`}>
			<div className="display-header">
				<div className="display-header-spacer" />
				<button className="display-back-button flex-box" onClick={localOnClose}>
					<CarretIcon />
				</button>
			</div>
			<div className="display-content">
				{children}
			</div>
		</div>
	)
};

export default DisplayCard;