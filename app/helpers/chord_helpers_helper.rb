module ChordHelpersHelper
	def chord_helper_pitch_classes_dataset(notes = [])
		(notes.map{ |note| note.id }).to_s
	end
end
