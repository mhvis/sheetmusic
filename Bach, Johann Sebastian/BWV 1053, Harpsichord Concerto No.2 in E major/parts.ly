\version "2.18.2"

\include "music.ly"

\paper {
  page-breaking = #ly:page-turn-breaking
}
%\set Staff.minimumPageTurnLength = #(ly:make-moment 2/1)

\layout {
  \context {
    \Score
    skipBars = ##t
  }
  \context {
    \Staff
    \consists "Page_turn_engraver"
    minimumPageTurnLength = #(ly:make-moment 3/1)
  }
}

\book {
  \bookOutputSuffix "vl-I"
  \header {
    instrument = "Violin I"
  }
  \score {
    \scoreAViolinI
    \layout {}
  }
}
\book {
  \bookOutputSuffix "vl-II"
  \header {
    instrument = "Violin II"
  }
  \score {
    \scoreAViolinII
    \layout {}
  }
}
\book {
  \bookOutputSuffix "vla"
  \header {
    instrument = "Viola"
  }
  \score {
    {
      \clef alto
      \scoreAViola
    }
    \layout {}
  }
}
\book {
  \bookOutputSuffix "bc"
  \header {
    instrument = "Basso Continuo"
  }
  \score {
    {
      \clef bass
      \scoreABcMusic
    }
    \layout {}
  }
}
