module ApplicationHelper

	#Amélioration du layout pour le titre
	def titre
		base_titre = "Simple App du Tutoriel Ruby on Rails"

		if @titre.nil?
			base_titre
		else
			"#{base_titre} | #{@titre}"
		end
	end

end
