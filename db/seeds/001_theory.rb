# pitch classes

pitch_class__c = PitchClass.create(solfege: 'Do', letter: 'C', position: 1)
pitch_class__c_sharp = PitchClass.create(solfege: 'Do#', letter: 'C#', position: 2)
pitch_class__d = PitchClass.create(solfege: 'Ré', letter: 'D', position: 3)
pitch_class__d_sharp = PitchClass.create(solfege: 'Ré#', letter: 'D#', position: 4)
pitch_class__e = PitchClass.create(solfege: 'Mi', letter: 'E', position: 5)
pitch_class__f = PitchClass.create(solfege: 'Fa', letter: 'F', position: 6)
pitch_class__f_sharp = PitchClass.create(solfege: 'Fa#', letter: 'F#', position: 7)
pitch_class__g = PitchClass.create(solfege: 'Sol', letter: 'G', position: 8)
pitch_class__g_sharp = PitchClass.create(solfege: 'Sol#', letter: 'G#', position: 9)
pitch_class__a = PitchClass.create(solfege: 'La', letter: 'A', position: 10)
pitch_class__a_sharp = PitchClass.create(solfege: 'La#', letter: 'A#', position: 11)
pitch_class__b = PitchClass.create(solfege: 'Si', letter: 'B', position: 12)

# scales

scale__chromatic = Scale.create(name: 'Chromatic', intervals: '1-1-1-1-1-1-1-1-1-1-1-1')
scale__major = Scale.create(name: 'Major', intervals: '2-2-1-2-2-2-1')
scale__minor_natural = Scale.create(name: 'Natural Minor', intervals: '2-1-2-2-1-2-2')
scale__minor_harmonic = Scale.create(name: 'Harmonic Minor', intervals: '2-1-2-2-1-3-1')
scale__minor_melodic = Scale.create(name: 'Melodic Minor', intervals: '2-1-2-2-2-2-1')
scale__blues = Scale.create(name: 'Blues', intervals: '3-2-1-1-3-2')

# pitch standard

pitch_standard = PitchStandard.create(name: 'western',semitone: 1.0595, base_frequency: nil)

# pitches

Pitch.create(octave: 0, pitch_class: pitch_class__c, frequency: 8.17579891564371, pitch_standard: pitch_standard ,midi: 0)
Pitch.create(octave: 0, pitch_class: pitch_class__c_sharp, frequency: 8.66195721802725, pitch_standard: pitch_standard ,midi: 1)
Pitch.create(octave: 0, pitch_class: pitch_class__d, frequency: 9.17702399741899, pitch_standard: pitch_standard ,midi: 2)
Pitch.create(octave: 0, pitch_class: pitch_class__d_sharp, frequency: 9.72271824131503, pitch_standard: pitch_standard ,midi: 3)
Pitch.create(octave: 0, pitch_class: pitch_class__e, frequency: 10.3008611535272, pitch_standard: pitch_standard ,midi: 4)
Pitch.create(octave: 0, pitch_class: pitch_class__f, frequency: 10.9133822322814, pitch_standard: pitch_standard ,midi: 5)
Pitch.create(octave: 0, pitch_class: pitch_class__f_sharp, frequency: 11.5623257097386, pitch_standard: pitch_standard ,midi: 6)
Pitch.create(octave: 0, pitch_class: pitch_class__g, frequency: 12.2498573744297, pitch_standard: pitch_standard ,midi: 7)
Pitch.create(octave: 0, pitch_class: pitch_class__g_sharp, frequency: 12.9782717993733, pitch_standard: pitch_standard ,midi: 8)
Pitch.create(octave: 0, pitch_class: pitch_class__a, frequency: 13.75, pitch_standard: pitch_standard ,midi: 9)
Pitch.create(octave: 0, pitch_class: pitch_class__a_sharp, frequency: 14.5676175474403, pitch_standard: pitch_standard ,midi: 10)
Pitch.create(octave: 0, pitch_class: pitch_class__b, frequency: 15.4338531642539, pitch_standard: pitch_standard ,midi: 11)
Pitch.create(octave: 1, pitch_class: pitch_class__c, frequency: 16.3515978312874, pitch_standard: pitch_standard ,midi: 12)
Pitch.create(octave: 1, pitch_class: pitch_class__c_sharp, frequency: 17.3239144360545, pitch_standard: pitch_standard ,midi: 13)
Pitch.create(octave: 1, pitch_class: pitch_class__d, frequency: 18.354047994838, pitch_standard: pitch_standard ,midi: 14)
Pitch.create(octave: 1, pitch_class: pitch_class__d_sharp, frequency: 19.4454364826301, pitch_standard: pitch_standard ,midi: 15)
Pitch.create(octave: 1, pitch_class: pitch_class__e, frequency: 20.6017223070544, pitch_standard: pitch_standard ,midi: 16)
Pitch.create(octave: 1, pitch_class: pitch_class__f, frequency: 21.8267644645627, pitch_standard: pitch_standard ,midi: 17)
Pitch.create(octave: 1, pitch_class: pitch_class__f_sharp, frequency: 23.1246514194771, pitch_standard: pitch_standard ,midi: 18)
Pitch.create(octave: 1, pitch_class: pitch_class__g, frequency: 24.4997147488593, pitch_standard: pitch_standard ,midi: 19)
Pitch.create(octave: 1, pitch_class: pitch_class__g_sharp, frequency: 25.9565435987466, pitch_standard: pitch_standard ,midi: 20)
Pitch.create(octave: 1, pitch_class: pitch_class__a, frequency: 27.5, pitch_standard: pitch_standard ,midi: 21)
Pitch.create(octave: 1, pitch_class: pitch_class__a_sharp, frequency: 29.1352350948806, pitch_standard: pitch_standard ,midi: 22)
Pitch.create(octave: 1, pitch_class: pitch_class__b, frequency: 30.8677063285077, pitch_standard: pitch_standard ,midi: 23)
Pitch.create(octave: 2, pitch_class: pitch_class__c, frequency: 32.7031956625748, pitch_standard: pitch_standard ,midi: 24)
Pitch.create(octave: 2, pitch_class: pitch_class__c_sharp, frequency: 34.647828872109, pitch_standard: pitch_standard ,midi: 25)
Pitch.create(octave: 2, pitch_class: pitch_class__d, frequency: 36.7080959896759, pitch_standard: pitch_standard ,midi: 26)
Pitch.create(octave: 2, pitch_class: pitch_class__d_sharp, frequency: 38.8908729652601, pitch_standard: pitch_standard ,midi: 27)
Pitch.create(octave: 2, pitch_class: pitch_class__e, frequency: 41.2034446141088, pitch_standard: pitch_standard ,midi: 28)
Pitch.create(octave: 2, pitch_class: pitch_class__f, frequency: 43.6535289291255, pitch_standard: pitch_standard ,midi: 29)
Pitch.create(octave: 2, pitch_class: pitch_class__f_sharp, frequency: 46.2493028389543, pitch_standard: pitch_standard ,midi: 30)
Pitch.create(octave: 2, pitch_class: pitch_class__g, frequency: 48.9994294977187, pitch_standard: pitch_standard ,midi: 31)
Pitch.create(octave: 2, pitch_class: pitch_class__g_sharp, frequency: 51.9130871974931, pitch_standard: pitch_standard ,midi: 32)
Pitch.create(octave: 2, pitch_class: pitch_class__a, frequency: 55.0, pitch_standard: pitch_standard ,midi: 33)
Pitch.create(octave: 2, pitch_class: pitch_class__a_sharp, frequency: 58.2704701897612, pitch_standard: pitch_standard ,midi: 34)
Pitch.create(octave: 2, pitch_class: pitch_class__b, frequency: 61.7354126570155, pitch_standard: pitch_standard ,midi: 35)
Pitch.create(octave: 3, pitch_class: pitch_class__c, frequency: 65.4063913251497, pitch_standard: pitch_standard ,midi: 36)
Pitch.create(octave: 3, pitch_class: pitch_class__c_sharp, frequency: 69.295657744218, pitch_standard: pitch_standard ,midi: 37)
Pitch.create(octave: 3, pitch_class: pitch_class__d, frequency: 73.4161919793519, pitch_standard: pitch_standard ,midi: 38)
Pitch.create(octave: 3, pitch_class: pitch_class__d_sharp, frequency: 77.7817459305202, pitch_standard: pitch_standard ,midi: 39)
Pitch.create(octave: 3, pitch_class: pitch_class__e, frequency: 82.4068892282175, pitch_standard: pitch_standard ,midi: 40)
Pitch.create(octave: 3, pitch_class: pitch_class__f, frequency: 87.307057858251, pitch_standard: pitch_standard ,midi: 41)
Pitch.create(octave: 3, pitch_class: pitch_class__f_sharp, frequency: 92.4986056779086, pitch_standard: pitch_standard ,midi: 42)
Pitch.create(octave: 3, pitch_class: pitch_class__g, frequency: 97.9988589954373, pitch_standard: pitch_standard ,midi: 43)
Pitch.create(octave: 3, pitch_class: pitch_class__g_sharp, frequency: 103.826174394986, pitch_standard: pitch_standard ,midi: 44)
Pitch.create(octave: 3, pitch_class: pitch_class__a, frequency: 110.0, pitch_standard: pitch_standard ,midi: 45)
Pitch.create(octave: 3, pitch_class: pitch_class__a_sharp, frequency: 116.540940379522, pitch_standard: pitch_standard ,midi: 46)
Pitch.create(octave: 3, pitch_class: pitch_class__b, frequency: 123.470825314031, pitch_standard: pitch_standard ,midi: 47)
Pitch.create(octave: 4, pitch_class: pitch_class__c, frequency: 130.812782650299, pitch_standard: pitch_standard ,midi: 48)
Pitch.create(octave: 4, pitch_class: pitch_class__c_sharp, frequency: 138.591315488436, pitch_standard: pitch_standard ,midi: 49)
Pitch.create(octave: 4, pitch_class: pitch_class__d, frequency: 146.832383958704, pitch_standard: pitch_standard ,midi: 50)
Pitch.create(octave: 4, pitch_class: pitch_class__d_sharp, frequency: 155.56349186104, pitch_standard: pitch_standard ,midi: 51)
Pitch.create(octave: 4, pitch_class: pitch_class__e, frequency: 164.813778456435, pitch_standard: pitch_standard ,midi: 52)
Pitch.create(octave: 4, pitch_class: pitch_class__f, frequency: 174.614115716502, pitch_standard: pitch_standard ,midi: 53)
Pitch.create(octave: 4, pitch_class: pitch_class__f_sharp, frequency: 184.997211355817, pitch_standard: pitch_standard ,midi: 54)
Pitch.create(octave: 4, pitch_class: pitch_class__g, frequency: 195.997717990875, pitch_standard: pitch_standard ,midi: 55)
Pitch.create(octave: 4, pitch_class: pitch_class__g_sharp, frequency: 207.652348789973, pitch_standard: pitch_standard ,midi: 56)
Pitch.create(octave: 4, pitch_class: pitch_class__a, frequency: 220.0, pitch_standard: pitch_standard ,midi: 57)
Pitch.create(octave: 4, pitch_class: pitch_class__a_sharp, frequency: 233.081880759045, pitch_standard: pitch_standard ,midi: 58)
Pitch.create(octave: 4, pitch_class: pitch_class__b, frequency: 246.941650628062, pitch_standard: pitch_standard ,midi: 59)
Pitch.create(octave: 5, pitch_class: pitch_class__c, frequency: 261.625565300599, pitch_standard: pitch_standard ,midi: 60)
Pitch.create(octave: 5, pitch_class: pitch_class__c_sharp, frequency: 277.182630976872, pitch_standard: pitch_standard ,midi: 61)
Pitch.create(octave: 5, pitch_class: pitch_class__d, frequency: 293.664767917408, pitch_standard: pitch_standard ,midi: 62)
Pitch.create(octave: 5, pitch_class: pitch_class__d_sharp, frequency: 311.126983722081, pitch_standard: pitch_standard ,midi: 63)
Pitch.create(octave: 5, pitch_class: pitch_class__e, frequency: 329.62755691287, pitch_standard: pitch_standard ,midi: 64)
Pitch.create(octave: 5, pitch_class: pitch_class__f, frequency: 349.228231433004, pitch_standard: pitch_standard ,midi: 65)
Pitch.create(octave: 5, pitch_class: pitch_class__f_sharp, frequency: 369.994422711634, pitch_standard: pitch_standard ,midi: 66)
Pitch.create(octave: 5, pitch_class: pitch_class__g, frequency: 391.995435981749, pitch_standard: pitch_standard ,midi: 67)
Pitch.create(octave: 5, pitch_class: pitch_class__g_sharp, frequency: 415.304697579945, pitch_standard: pitch_standard ,midi: 68)
Pitch.create(octave: 5, pitch_class: pitch_class__a, frequency: 440.0, pitch_standard: pitch_standard ,midi: 69)
Pitch.create(octave: 5, pitch_class: pitch_class__a_sharp, frequency: 466.16376151809, pitch_standard: pitch_standard ,midi: 70)
Pitch.create(octave: 5, pitch_class: pitch_class__b, frequency: 493.883301256124, pitch_standard: pitch_standard ,midi: 71)
Pitch.create(octave: 6, pitch_class: pitch_class__c, frequency: 523.251130601197, pitch_standard: pitch_standard ,midi: 72)
Pitch.create(octave: 6, pitch_class: pitch_class__c_sharp, frequency: 554.365261953744, pitch_standard: pitch_standard ,midi: 73)
Pitch.create(octave: 6, pitch_class: pitch_class__d, frequency: 587.329535834815, pitch_standard: pitch_standard ,midi: 74)
Pitch.create(octave: 6, pitch_class: pitch_class__d_sharp, frequency: 622.253967444162, pitch_standard: pitch_standard ,midi: 75)
Pitch.create(octave: 6, pitch_class: pitch_class__e, frequency: 659.25511382574, pitch_standard: pitch_standard ,midi: 76)
Pitch.create(octave: 6, pitch_class: pitch_class__f, frequency: 698.456462866008, pitch_standard: pitch_standard ,midi: 77)
Pitch.create(octave: 6, pitch_class: pitch_class__f_sharp, frequency: 739.988845423269, pitch_standard: pitch_standard ,midi: 78)
Pitch.create(octave: 6, pitch_class: pitch_class__g, frequency: 783.990871963499, pitch_standard: pitch_standard ,midi: 79)
Pitch.create(octave: 6, pitch_class: pitch_class__g_sharp, frequency: 830.60939515989, pitch_standard: pitch_standard ,midi: 80)
Pitch.create(octave: 6, pitch_class: pitch_class__a, frequency: 880.0, pitch_standard: pitch_standard ,midi: 81)
Pitch.create(octave: 6, pitch_class: pitch_class__a_sharp, frequency: 932.32752303618, pitch_standard: pitch_standard ,midi: 82)
Pitch.create(octave: 6, pitch_class: pitch_class__b, frequency: 987.766602512248, pitch_standard: pitch_standard ,midi: 83)
Pitch.create(octave: 7, pitch_class: pitch_class__c, frequency: 1046.50226120239, pitch_standard: pitch_standard ,midi: 84)
Pitch.create(octave: 7, pitch_class: pitch_class__c_sharp, frequency: 1108.73052390749, pitch_standard: pitch_standard ,midi: 85)
Pitch.create(octave: 7, pitch_class: pitch_class__d, frequency: 1174.65907166963, pitch_standard: pitch_standard ,midi: 86)
Pitch.create(octave: 7, pitch_class: pitch_class__d_sharp, frequency: 1244.50793488832, pitch_standard: pitch_standard ,midi: 87)
Pitch.create(octave: 7, pitch_class: pitch_class__e, frequency: 1318.51022765148, pitch_standard: pitch_standard ,midi: 88)
Pitch.create(octave: 7, pitch_class: pitch_class__f, frequency: 1396.91292573202, pitch_standard: pitch_standard ,midi: 89)
Pitch.create(octave: 7, pitch_class: pitch_class__f_sharp, frequency: 1479.97769084654, pitch_standard: pitch_standard ,midi: 90)
Pitch.create(octave: 7, pitch_class: pitch_class__g, frequency: 1567.981743927, pitch_standard: pitch_standard ,midi: 91)
Pitch.create(octave: 7, pitch_class: pitch_class__g_sharp, frequency: 1661.21879031978, pitch_standard: pitch_standard ,midi: 92)
Pitch.create(octave: 7, pitch_class: pitch_class__a, frequency: 1760.0, pitch_standard: pitch_standard ,midi: 93)
Pitch.create(octave: 7, pitch_class: pitch_class__a_sharp, frequency: 1864.65504607236, pitch_standard: pitch_standard ,midi: 94)
Pitch.create(octave: 7, pitch_class: pitch_class__b, frequency: 1975.5332050245, pitch_standard: pitch_standard ,midi: 95)
Pitch.create(octave: 8, pitch_class: pitch_class__c, frequency: 2093.00452240479, pitch_standard: pitch_standard ,midi: 96)
Pitch.create(octave: 8, pitch_class: pitch_class__c_sharp, frequency: 2217.46104781498, pitch_standard: pitch_standard ,midi: 97)
Pitch.create(octave: 8, pitch_class: pitch_class__d, frequency: 2349.31814333926, pitch_standard: pitch_standard ,midi: 98)
Pitch.create(octave: 8, pitch_class: pitch_class__d_sharp, frequency: 2489.01586977665, pitch_standard: pitch_standard ,midi: 99)
Pitch.create(octave: 8, pitch_class: pitch_class__e, frequency: 2637.02045530296, pitch_standard: pitch_standard ,midi: 100)
Pitch.create(octave: 8, pitch_class: pitch_class__f, frequency: 2793.82585146403, pitch_standard: pitch_standard ,midi: 101)
Pitch.create(octave: 8, pitch_class: pitch_class__f_sharp, frequency: 2959.95538169308, pitch_standard: pitch_standard ,midi: 102)
Pitch.create(octave: 8, pitch_class: pitch_class__g, frequency: 3135.96348785399, pitch_standard: pitch_standard ,midi: 103)
Pitch.create(octave: 8, pitch_class: pitch_class__g_sharp, frequency: 3322.43758063956, pitch_standard: pitch_standard ,midi: 104)
Pitch.create(octave: 8, pitch_class: pitch_class__a, frequency: 3520.0, pitch_standard: pitch_standard ,midi: 105)
Pitch.create(octave: 8, pitch_class: pitch_class__a_sharp, frequency: 3729.31009214472, pitch_standard: pitch_standard ,midi: 106)
Pitch.create(octave: 8, pitch_class: pitch_class__b, frequency: 3951.06641004899, pitch_standard: pitch_standard ,midi: 107)
Pitch.create(octave: 9, pitch_class: pitch_class__c, frequency: 4186.00904480958, pitch_standard: pitch_standard ,midi: 108)
Pitch.create(octave: 9, pitch_class: pitch_class__c_sharp, frequency: 4434.92209562995, pitch_standard: pitch_standard ,midi: 109)
Pitch.create(octave: 9, pitch_class: pitch_class__d, frequency: 4698.63628667852, pitch_standard: pitch_standard ,midi: 110)
Pitch.create(octave: 9, pitch_class: pitch_class__d_sharp, frequency: 4978.0317395533, pitch_standard: pitch_standard ,midi: 111)
Pitch.create(octave: 9, pitch_class: pitch_class__e, frequency: 5274.04091060592, pitch_standard: pitch_standard ,midi: 112)
Pitch.create(octave: 9, pitch_class: pitch_class__f, frequency: 5587.65170292806, pitch_standard: pitch_standard ,midi: 113)
Pitch.create(octave: 9, pitch_class: pitch_class__f_sharp, frequency: 5919.91076338615, pitch_standard: pitch_standard ,midi: 114)
Pitch.create(octave: 9, pitch_class: pitch_class__g, frequency: 6271.92697570799, pitch_standard: pitch_standard ,midi: 115)
Pitch.create(octave: 9, pitch_class: pitch_class__g_sharp, frequency: 6644.87516127912, pitch_standard: pitch_standard ,midi: 116)
Pitch.create(octave: 9, pitch_class: pitch_class__a, frequency: 7040.0, pitch_standard: pitch_standard ,midi: 117)
Pitch.create(octave: 9, pitch_class: pitch_class__a_sharp, frequency: 7458.62018428944, pitch_standard: pitch_standard ,midi: 118)
Pitch.create(octave: 9, pitch_class: pitch_class__b, frequency: 7902.13282009799, pitch_standard: pitch_standard ,midi: 119)

# interval quality
interval_quality__perfect = IntervalQuality.create(name: "Perfect", shorthand: "P", modifier: 0)
interval_quality__minor = IntervalQuality.create(name: "Minor", shorthand: "m", modifier: -1)
interval_quality__major = IntervalQuality.create(name: "Major", shorthand: "M", modifier: 0)
interval_quality__augmented = IntervalQuality.create(name: "Augmented", shorthand: "aug", modifier: 1)
interval_quality__diminished = IntervalQuality.create(name: "Diminished", shorthand: "dim", modifier: -2)

# intervals
interval__unison = Interval.create(name: "Unison", shorthand: "1", semitones: 0)
interval__second = Interval.create(name: "Second", shorthand: "2", semitones: 2)
interval__third = Interval.create(name: "Third", shorthand: "3", semitones: 4)
interval__fourth = Interval.create(name: "Fourth", shorthand: "4", semitones: 5)
interval__fifth = Interval.create(name: "Fifth", shorthand: "5", semitones: 7)
interval__sixth = Interval.create(name: "Sixth", shorthand: "6", semitones: 9)
interval__seventh = Interval.create(name: "Seventh", shorthand: "7", semitones: 11)
interval__octave = Interval.create(name: "Octave", shorthand: "8", semitones: 12)

# scale intervals

# chromatic scale has 12 identical, 1-semitones (minor 2nds) intervals
12.times { |i| scale__chromatic.scale_intervals.push(ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: i))}

# major scale 2-2-1-2-2-2-1
scale__major.scale_intervals = [
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 1),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 2),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 3),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 4),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 5),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 6),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 7),
]

# minor natural scale 2-1-2-2-1-2-2
scale__minor_natural.scale_intervals = [
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 1),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 2),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 3),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 4),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 5),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 6),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 7),
]

# minor harmonic scale 2-1-2-2-1-3-1
scale__minor_harmonic.scale_intervals = [
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 1),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 2),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 3),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 4),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 5),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__augmented, sequence: 6),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 7),
]

# minor melodic scale 2-1-2-2-2-2-1
scale__minor_melodic.scale_intervals = [
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 1),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 2),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 3),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 4),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 5),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 6),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 7),
]

# blues scale 3-2-1-1-3-2
scale__blues.scale_intervals = [
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__augmented, sequence: 1),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 2),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 3),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__minor, sequence: 4),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__augmented, sequence: 5),
    ScaleInterval.create(interval: interval__second, interval_quality: interval_quality__major, sequence: 6),
]

# keys
Key.create(name: "C Major", shorthand: "C", sharps: 0, flats: 0, pitch_class: pitch_class__c, quality: "major")
Key.create(name: "G Major", shorthand: "G", sharps: 1, flats: 0, pitch_class: pitch_class__g, quality: "major")
Key.create(name: "D Major", shorthand: "D", sharps: 2, flats: 0, pitch_class: pitch_class__d, quality: "major")
Key.create(name: "A Major", shorthand: "A", sharps: 3, flats: 0, pitch_class: pitch_class__a, quality: "major")
Key.create(name: "E Major", shorthand: "E", sharps: 4, flats: 0, pitch_class: pitch_class__e, quality: "major")
Key.create(name: "B Major", shorthand: "B", sharps: 5, flats: 0, pitch_class: pitch_class__b, quality: "major")
Key.create(name: "F# Major", shorthand: "F#", sharps: 6, flats: 0, pitch_class: pitch_class__f_sharp, quality: "major")
Key.create(name: "C# Major", shorthand: "C#", sharps: 7, flats: 0, pitch_class: pitch_class__c_sharp, quality: "major")
Key.create(name: "F Major", shorthand: "F", sharps: 0, flats: 1, pitch_class: pitch_class__f, quality: "major")
Key.create(name: "Bb Major", shorthand: "Bb", sharps: 0, flats: 2, pitch_class: pitch_class__a_sharp, quality: "major")
Key.create(name: "Eb Major", shorthand: "Eb", sharps: 0, flats: 3, pitch_class: pitch_class__d_sharp, quality: "major")
Key.create(name: "Ab Major", shorthand: "Ab", sharps: 0, flats: 4, pitch_class: pitch_class__g_sharp, quality: "major")
Key.create(name: "Db Major", shorthand: "Db", sharps: 0, flats: 5, pitch_class: pitch_class__c_sharp, quality: "major")
Key.create(name: "Gb Major", shorthand: "Gb", sharps: 0, flats: 6, pitch_class: pitch_class__f_sharp, quality: "major")
Key.create(name: "Cb Major", shorthand: "Cb", sharps: 0, flats: 7, pitch_class: pitch_class__b, quality: "major")
Key.create(name: "A Minor", shorthand: "Am", sharps: 0, flats: 0, pitch_class: pitch_class__a, quality: "minor")
Key.create(name: "E Minor", shorthand: "Em", sharps: 1, flats: 0, pitch_class: pitch_class__e, quality: "minor")
Key.create(name: "B Minor", shorthand: "Bm", sharps: 2, flats: 0, pitch_class: pitch_class__b, quality: "minor")
Key.create(name: "F# Minor", shorthand: "F#m", sharps: 3, flats: 0, pitch_class: pitch_class__f_sharp, quality: "minor")
Key.create(name: "C# Minor", shorthand: "C#m", sharps: 4, flats: 0, pitch_class: pitch_class__c_sharp, quality: "minor")
Key.create(name: "G# Minor", shorthand: "G#m", sharps: 5, flats: 0, pitch_class: pitch_class__g_sharp, quality: "minor")
Key.create(name: "D# Minor", shorthand: "D#m", sharps: 6, flats: 0, pitch_class: pitch_class__d_sharp, quality: "minor")
Key.create(name: "A# Minor", shorthand: "A#m", sharps: 7, flats: 0, pitch_class: pitch_class__a_sharp, quality: "minor")
Key.create(name: "D Minor", shorthand: "Dm", sharps: 0, flats: 1, pitch_class: pitch_class__d, quality: "minor")
Key.create(name: "G Minor", shorthand: "Gm", sharps: 0, flats: 2, pitch_class: pitch_class__g, quality: "minor")
Key.create(name: "C Minor", shorthand: "Cm", sharps: 0, flats: 3, pitch_class: pitch_class__c, quality: "minor")
Key.create(name: "F Minor", shorthand: "Fm", sharps: 0, flats: 4, pitch_class: pitch_class__f, quality: "minor")
Key.create(name: "Bb Minor", shorthand: "Bbm", sharps: 0, flats: 5, pitch_class: pitch_class__a_sharp, quality: "minor")
Key.create(name: "Eb Minor", shorthand: "Ebm", sharps: 0, flats: 6, pitch_class: pitch_class__d_sharp, quality: "minor")
Key.create(name: "Ab Minor", shorthand: "Abm", sharps: 0, flats: 7, pitch_class: pitch_class__g_sharp, quality: "minor")

# chord templates
chord__major_triad = Chord.create(name: "Major Triad", notation: "")
ChordComponent.create(chord: chord__major_triad, interval: interval__unison, interval_quality: interval_quality__perfect)             # P1 => 0 => C
ChordComponent.create(chord: chord__major_triad, interval: interval__third, interval_quality: interval_quality__major)                # M3 => 4 => E
ChordComponent.create(chord: chord__major_triad, interval: interval__fifth, interval_quality: interval_quality__perfect)              # P5 => 7 => G

chord__minor_triad = Chord.create(name: "Minor Triad", notation: "m")
ChordComponent.create(chord: chord__minor_triad, interval: interval__unison, interval_quality: interval_quality__perfect)             # P1 => 0 => C
ChordComponent.create(chord: chord__minor_triad, interval: interval__third, interval_quality: interval_quality__minor)                # m3 => 3 => Eb
ChordComponent.create(chord: chord__minor_triad, interval: interval__fifth, interval_quality: interval_quality__perfect)              # P5 => 7 => G

chord__major_sixth = Chord.create(name: "Major Sixth", notation: "6")
ChordComponent.create(chord: chord__major_sixth, interval: interval__unison, interval_quality: interval_quality__perfect)             # P1 => 0 => C
ChordComponent.create(chord: chord__major_sixth, interval: interval__third, interval_quality: interval_quality__major)                # M3 => 4 => E
ChordComponent.create(chord: chord__major_sixth, interval: interval__fifth, interval_quality: interval_quality__perfect)              # P5 => 7 => G
ChordComponent.create(chord: chord__major_sixth, interval: interval__sixth, interval_quality: interval_quality__major)                # M6 => 9 => A

chord__dominant_seventh = Chord.create(name: "Dominant Seventh", notation: "7")
ChordComponent.create(chord: chord__dominant_seventh, interval: interval__unison, interval_quality: interval_quality__perfect)        # P1 => 0 => C
ChordComponent.create(chord: chord__dominant_seventh, interval: interval__third, interval_quality: interval_quality__major)           # M3 => 4 => E
ChordComponent.create(chord: chord__dominant_seventh, interval: interval__fifth, interval_quality: interval_quality__perfect)         # P5 => 7 => G
ChordComponent.create(chord: chord__dominant_seventh, interval: interval__seventh, interval_quality: interval_quality__minor)         # m7 => 10 => A#

chord__major_seventh = Chord.create(name: "Major Seventh", notation: "maj7")
ChordComponent.create(chord: chord__major_seventh, interval: interval__unison, interval_quality: interval_quality__perfect)           # P1 => 0 => C
ChordComponent.create(chord: chord__major_seventh, interval: interval__third, interval_quality: interval_quality__major)              # M3 => 4 => E
ChordComponent.create(chord: chord__major_seventh, interval: interval__fifth, interval_quality: interval_quality__perfect)            # P5 => 7 => G
ChordComponent.create(chord: chord__major_seventh, interval: interval__seventh, interval_quality: interval_quality__major)            # M7 => 11 => B

chord__augmented_triad = Chord.create(name: "Augmented Triad", notation: "+")
ChordComponent.create(chord: chord__augmented_triad, interval: interval__unison, interval_quality: interval_quality__perfect)         # P1 => 0 => C
ChordComponent.create(chord: chord__augmented_triad, interval: interval__third, interval_quality: interval_quality__major)            # M3 => 4 => E
ChordComponent.create(chord: chord__augmented_triad, interval: interval__fifth, interval_quality: interval_quality__augmented)        # A5 => 8 => G#

chord__augmented_seventh = Chord.create(name: "Augmented Seventh", notation: "7+")
ChordComponent.create(chord: chord__augmented_seventh, interval: interval__unison, interval_quality: interval_quality__perfect)       # P1 => 0 => C
ChordComponent.create(chord: chord__augmented_seventh, interval: interval__third, interval_quality: interval_quality__major)          # M3 => 4 => E
ChordComponent.create(chord: chord__augmented_seventh, interval: interval__fifth, interval_quality: interval_quality__augmented)      # A5 => 8 => G#
ChordComponent.create(chord: chord__augmented_seventh, interval: interval__seventh, interval_quality: interval_quality__minor)        # m7 => 10 => A#

chord__minor_sixth = Chord.create(name: "Minor Sixth", notation: "m6")
ChordComponent.create(chord: chord__minor_sixth, interval: interval__unison, interval_quality: interval_quality__perfect)             # P1 => 0 => C
ChordComponent.create(chord: chord__minor_sixth, interval: interval__third, interval_quality: interval_quality__minor)                # m3 => 3 => Eb
ChordComponent.create(chord: chord__minor_sixth, interval: interval__fifth, interval_quality: interval_quality__perfect)              # P5 => 7 => G
ChordComponent.create(chord: chord__minor_sixth, interval: interval__sixth, interval_quality: interval_quality__major)                # M6 => 9 => A

chord__minor_seventh = Chord.create(name: "Minor Seventh", notation: "m7")
ChordComponent.create(chord: chord__minor_seventh, interval: interval__unison, interval_quality: interval_quality__perfect)           # P1 => 0 => C
ChordComponent.create(chord: chord__minor_seventh, interval: interval__third, interval_quality: interval_quality__minor)              # m3 => 3 => Eb
ChordComponent.create(chord: chord__minor_seventh, interval: interval__fifth, interval_quality: interval_quality__perfect)            # P5 => 7 => G
ChordComponent.create(chord: chord__minor_seventh, interval: interval__seventh, interval_quality: interval_quality__minor)            # m7 => 10 => A#

chord__minor_major_seventh = Chord.create(name: "Minor-major Seventh", notation: "mM7")
ChordComponent.create(chord: chord__minor_major_seventh, interval: interval__unison, interval_quality: interval_quality__perfect)     # P1 => 0 => C
ChordComponent.create(chord: chord__minor_major_seventh, interval: interval__third, interval_quality: interval_quality__minor)        # m3 => 3 => Eb
ChordComponent.create(chord: chord__minor_major_seventh, interval: interval__fifth, interval_quality: interval_quality__perfect)      # P5 => 7 => G
ChordComponent.create(chord: chord__minor_major_seventh, interval: interval__seventh, interval_quality: interval_quality__major)      # M7 => 11 => B

chord__diminished_triad = Chord.create(name: "Diminished Triad", notation: "dim")
ChordComponent.create(chord: chord__diminished_triad, interval: interval__unison, interval_quality: interval_quality__perfect)        # P1 => 0 => C
ChordComponent.create(chord: chord__diminished_triad, interval: interval__third, interval_quality: interval_quality__major)           # M3 => 4 => E
ChordComponent.create(chord: chord__diminished_triad, interval: interval__fifth, interval_quality: interval_quality__diminished)      # d5 => 6 => F#

chord__diminished_seventh = Chord.create(name: "Diminished Seventh", notation: "7dim")
ChordComponent.create(chord: chord__diminished_seventh, interval: interval__unison, interval_quality: interval_quality__perfect)      # P1 => 0 => C
ChordComponent.create(chord: chord__diminished_seventh, interval: interval__third, interval_quality: interval_quality__major)         # M3 => 4 => E
ChordComponent.create(chord: chord__diminished_seventh, interval: interval__fifth, interval_quality: interval_quality__diminished)    # d5 => 6 => F#
ChordComponent.create(chord: chord__diminished_seventh, interval: interval__seventh, interval_quality: interval_quality__diminished)  # d7 => 9 => A

chord__half_diminished_seventh = Chord.create(name: "Half-diminished Seventh", notation: "7*")
ChordComponent.create(chord: chord__half_diminished_seventh, interval: interval__unison, interval_quality: interval_quality__perfect) # P1 => 0 => C
ChordComponent.create(chord: chord__half_diminished_seventh, interval: interval__third, interval_quality: interval_quality__major)    # M3 => 4 => E
ChordComponent.create(chord: chord__half_diminished_seventh, interval: interval__fifth, interval_quality: interval_quality__perfect)  # d5 => 6 => G
ChordComponent.create(chord: chord__half_diminished_seventh, interval: interval__seventh, interval_quality: interval_quality__minor)  # m7 => 10 => A#

chord__suspended_fourth = Chord.create(name: "Suspended Fourth", notation: "sus4")
ChordComponent.create(chord: chord__suspended_fourth, interval: interval__unison, interval_quality: interval_quality__perfect) # P1 => 0 => C
ChordComponent.create(chord: chord__suspended_fourth, interval: interval__fourth, interval_quality: interval_quality__perfect) # P4 => 5 => F
ChordComponent.create(chord: chord__suspended_fourth, interval: interval__fifth, interval_quality: interval_quality__perfect) # P5 => 7 => G

chord__suspended_second = Chord.create(name: "Suspended Second", notation: "sus2")
ChordComponent.create(chord: chord__suspended_second, interval: interval__unison, interval_quality: interval_quality__perfect) # P1 => 0 => C
ChordComponent.create(chord: chord__suspended_second, interval: interval__second, interval_quality: interval_quality__major) # M2 => 2 => D
ChordComponent.create(chord: chord__suspended_second, interval: interval__fifth, interval_quality: interval_quality__perfect) # P5 => 7 => G

chord__double_suspended = Chord.create(name: "Double Suspended", notation: "sus2sus4")
ChordComponent.create(chord: chord__double_suspended, interval: interval__unison, interval_quality: interval_quality__perfect) # P1 => 0 => C
ChordComponent.create(chord: chord__double_suspended, interval: interval__second, interval_quality: interval_quality__major) # M2 => 2 => D
ChordComponent.create(chord: chord__double_suspended, interval: interval__fourth, interval_quality: interval_quality__perfect) # P4 => 5 => F
ChordComponent.create(chord: chord__double_suspended, interval: interval__fifth, interval_quality: interval_quality__perfect) # P5 => 7 => G

chord__seventh_suspended_fourth = Chord.create(name: "Seventh Suspended Fourth", notation: "7sus4")
ChordComponent.create(chord: chord__seventh_suspended_fourth, interval: interval__unison, interval_quality: interval_quality__perfect) # P1 => 0 => C
ChordComponent.create(chord: chord__seventh_suspended_fourth, interval: interval__fourth, interval_quality: interval_quality__perfect) # P4 => 5 => F
ChordComponent.create(chord: chord__seventh_suspended_fourth, interval: interval__fifth, interval_quality: interval_quality__perfect) # P5 => 7 => G
ChordComponent.create(chord: chord__seventh_suspended_fourth, interval: interval__seventh, interval_quality: interval_quality__major) # M7 => 11 => B

chord__seventh_suspended_second = Chord.create(name: "Seventh Suspended Second", notation: "7sus2")
ChordComponent.create(chord: chord__seventh_suspended_second, interval: interval__unison, interval_quality: interval_quality__perfect) # P1 => 0 => C
ChordComponent.create(chord: chord__seventh_suspended_second, interval: interval__second, interval_quality: interval_quality__major) # M2 => 2 => D
ChordComponent.create(chord: chord__seventh_suspended_second, interval: interval__fifth, interval_quality: interval_quality__perfect) # P5 => 7 => G
ChordComponent.create(chord: chord__seventh_suspended_second, interval: interval__seventh, interval_quality: interval_quality__minor) # m7 => 11 => Bb

# time signatures
TimeSignature.create(label: "4/4")
TimeSignature.create(label: "3/4")
TimeSignature.create(label: "2/4")
TimeSignature.create(label: "2/2")
TimeSignature.create(label: "3/8")
TimeSignature.create(label: "6/8")
TimeSignature.create(label: "9/8")
TimeSignature.create(label: "12/8")
