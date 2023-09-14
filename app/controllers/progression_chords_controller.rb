class ProgressionChordsController < ApplicationController

    # minimum required parameters to print an arbitrary progression_chord
    # verify :params => ['key', 'scale', 'chord_type', 'degree', 'modifier', 'duration'], :only => :print

    def print()
        #key, scale, chord_type = Chord.find_by_name('Major Triad'), degree = 1, modifier = 0, duration = 4, bass_degree = nil, bass_modifier = nil
        #pc = ProgressionChord.new(chord: chord_type, degree: degree, modifier: modifier, duration: duration, bass_degree: bass_degree, bass_modifier: bass_modifier)
        pc = ProgressionChord.new(chord: Chord.find_by_id(params[:chord]), degree: params[:degree], modifier: params[:modifier], duration: params[:duration], bass_degree: nil, bass_modifier: nil)

        render plain: pc.print(Key.find_by_id(params[:key]), Scale.find_by_id(params[:scale]))
    end
end
