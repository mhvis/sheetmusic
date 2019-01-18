\version "2.18.2"

\include "music.ly"

scoreAViolinIPart = \new Staff \with {
  instrumentName = "Violin I"
  shortInstrumentName = "Vl. I"
  midiInstrument = "violin"
} \scoreAViolinI

scoreAViolinIIPart = \new Staff \with {
  instrumentName = "Violin II"
  shortInstrumentName = "Vl. II"
  midiInstrument = "violin"
} \scoreAViolinII

scoreAViolaPart = \new Staff \with {
  instrumentName = "Viola"
  shortInstrumentName = "Vla."
  midiInstrument = "viola"
} { \clef alto \scoreAViola }

scoreABassoContinuoPart = \new Staff \with {
  instrumentName = \markup {
      \center-column { "Basso"
        \line { "Continuo" }
      }
    }
  shortInstrumentName = "B.c."
  midiInstrument = "cello"
} { \clef bass \scoreABcMusic }


\header {
  instrument = "Violin I, Violin II, Viola, Basso Continuo"
}
\score {
  <<
    \scoreAViolinIPart
    \scoreAViolinIIPart
    \scoreAViolaPart
    \scoreABassoContinuoPart
  >>
  \layout {
    short-indent = 0.5\cm
  }
  \midi {
    \tempo 4=88
  }
}
