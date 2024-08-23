unless InstrumentTemplate.any?
    instrument_template__guitar = InstrumentTemplate.create(name: "Guitar", description: "A fretboard with even-length strings", filename: "guitar")
    instrument_template__piano = InstrumentTemplate.create(name: "Piano", description: "A sequence of piano keys", filename: "piano")
    instrument_template__banjo = InstrumentTemplate.create(name: "5-string Banjo", description: "A fretboard with a set of even-length strings followed by a shorter string", filename: "banjo")
end

unless Instrument.any?
    instrument__guitar = Instrument.create(name: 'Guitar', instrument_template: instrument_template__guitar)
    instrument__piano = Instrument.create(name: 'Piano', instrument_template: instrument_template__piano)
    instrument__bass = Instrument.create(name: 'Bass Guitar', instrument_template: instrument_template__guitar)
    instrument__mandolin = Instrument.create(name: 'Mandolin', instrument_template: instrument_template__guitar)
    instrument__banjo = Instrument.create(name: '5-string Banjo', instrument_template: instrument_template__banjo)
    instrument__ukulele = Instrument.create(name: 'Ukulele', instrument_template: instrument_template__guitar)
end

unless Tuning.any?
    # 6-string Guitar tuning
    tuning__6_string_guitar__standard = Tuning.create(instrument: instrument__guitar, label: "Standard", strings: [
        TuningPitch.create(pitch: Pitch.find_by_midi(40)),
        TuningPitch.create(pitch: Pitch.find_by_midi(45)),
        TuningPitch.create(pitch: Pitch.find_by_midi(50)),
        TuningPitch.create(pitch: Pitch.find_by_midi(55)),
        TuningPitch.create(pitch: Pitch.find_by_midi(59)),
        TuningPitch.create(pitch: Pitch.find_by_midi(64))])

    tuning__6_string_guitar__drop_d = Tuning.create(instrument: instrument__guitar, label: "Drop D", strings: [
        TuningPitch.create(pitch: Pitch.find_by_midi(38)),
        TuningPitch.create(pitch: Pitch.find_by_midi(45)),
        TuningPitch.create(pitch: Pitch.find_by_midi(50)),
        TuningPitch.create(pitch: Pitch.find_by_midi(55)),
        TuningPitch.create(pitch: Pitch.find_by_midi(59)),
        TuningPitch.create(pitch: Pitch.find_by_midi(64))])

    tuning__6_string_guitar__half_step_down = Tuning.create(instrument: instrument__guitar, label: "1/2 Step Down", strings: [
        TuningPitch.create(pitch: Pitch.find_by_midi(39)),
        TuningPitch.create(pitch: Pitch.find_by_midi(44)),
        TuningPitch.create(pitch: Pitch.find_by_midi(49)),
        TuningPitch.create(pitch: Pitch.find_by_midi(54)),
        TuningPitch.create(pitch: Pitch.find_by_midi(58)),
        TuningPitch.create(pitch: Pitch.find_by_midi(63))])


    # bass guitar tunings
    tuning__4_string_bass_guitar__standard = Tuning.create(instrument: instrument__bass, label: "Standard", strings: [
        TuningPitch.create(pitch: Pitch.find_by_midi(40)),
        TuningPitch.create(pitch: Pitch.find_by_midi(45)),
        TuningPitch.create(pitch: Pitch.find_by_midi(50)),
        TuningPitch.create(pitch: Pitch.find_by_midi(55))])


    # banjo tunings
    tuning__5_string_banjo__standard = Tuning.create(instrument: instrument__banjo, label: "Standard", strings: [
        TuningPitch.create(pitch: Pitch.find_by_midi(55)),
        TuningPitch.create(pitch: Pitch.find_by_midi(38)),
        TuningPitch.create(pitch: Pitch.find_by_midi(43)),
        TuningPitch.create(pitch: Pitch.find_by_midi(47)),
        TuningPitch.create(pitch: Pitch.find_by_midi(50))])


    # ukulele tunings
    tuning__ukulele__standard = Tuning.create(instrument: instrument__ukulele, label: "Standard", strings: [
        TuningPitch.create(pitch: Pitch.find_by_midi(67)),
        TuningPitch.create(pitch: Pitch.find_by_midi(60)),
        TuningPitch.create(pitch: Pitch.find_by_midi(64)),
        TuningPitch.create(pitch: Pitch.find_by_midi(69)),
    ])

    # mandolin tunings
    tuning__mandolin__standard = Tuning.create(instrument: instrument__mandolin, label: "Standard", strings: [
        TuningPitch.create(pitch: Pitch.find_by_midi(55)),
        TuningPitch.create(pitch: Pitch.find_by_midi(62)),
        TuningPitch.create(pitch: Pitch.find_by_midi(69)),
        TuningPitch.create(pitch: Pitch.find_by_midi(76)),
    ])
end
