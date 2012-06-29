class PagesController < HighVoltage::PagesController
	skip_authorization_check
	layout 'minimal'
end
