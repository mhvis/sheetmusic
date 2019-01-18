\version "2.18.2"

% SCHLEIFER
%% http://lsr.di.unimi.it/LSR/Item?id=720
%% see also http://lilypond.org/doc/v2.18/Documentation/notation/graphic
%LSR contributed by Valentin as per request http://code.google.com/p/lilypond/issues/detail?id=503
schleifer =
#(define-music-function (parser location start) (ly:music?)
  #{\once \override Slur $'direction = #UP
    \once \override Slur $'stencil = $(lambda (grob)
    (let* ((slur-stencil (ly:slur::print grob))
           (Y-ext (ly:stencil-extent slur-stencil Y))
           (text-stencil (ly:text-interface::print grob))
           (prall-stencil (ly:stencil-translate text-stencil
                           (cons 2.5 (car Y-ext))))
           (combo-stencil (ly:stencil-combine-at-edge
                           prall-stencil X RIGHT
                           slur-stencil 0))
            (combo-X-ext (ly:stencil-extent combo-stencil X)))
      (ly:stencil-translate combo-stencil (cons 0 -1))))
    \once \override Slur.positions = #'(-1 . 2)
    \once \override Slur.text = \markup {
    \musicglyph #"scripts.prall" }
    \once \override Slur $'control-points = $(lambda (grob)
    (let* ((coords (ly:slur::calc-control-points grob))
            (point-0 (list-ref coords 0))
            (point-1 (list-ref coords 1))
            (point-2 (list-ref coords 2))
            (point-3 (list-ref coords 3)))
    (set-car! point-0 (+ (car point-0) 2))
    (set-car! point-1 (+ (car point-1) 1.5))
    (set-car! point-2 (+ (car point-2) -1))
    (set-car! point-3 (+ (car point-3) -1))
    coords))
    s1*0( $start
    \once \override Rest.transparent = ##t
    \once \override Rest.X-extent = #'(0 . 5)
    \grace r1
    s1*0) #})

\header {
  title = "Harpsichord Concerto No.2 in E major"
  composer = "Johann Sebastian Bach"
  opus = "BWV 1053"
  tagline = "Typeset using LilyPond by Maarten Visscher. Source: https://github.com/mhvis/sheetmusic."
  piece = "Movement I"
  copyright = \markup {
    \center-column {
      "This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License."
      "To view a copy of this license, visit http://creativecommons.org/licenses/by-nc/4.0/."
    }
  }
}

\paper {
  #(set-paper-size "a4")
}

global = {
  \key e \major
  \time 4/4
  \partial 8
}

% PARTS:
% 1-62
% 63-113: middle part
% 114-175: repeat of begin

scoreAViolinI = \relative c'' {
  \global
  b8
  e16(dis e gis) e b gis b e, b' gis b e, b' gis b
  e(dis e gis) e b gis b e, b' gis b e b fis' b,
  gis'8-. \schleifer fis-. a-. gis-. fis\trill e b'4(
  b16) e, dis e fis8 e dis16 e fis dis b-! a'( gis fis)
  b,-! gis'( fis e) b-! fis'( e dis) e-! a,( gis fis) e-! d'( cis b)
  cis( b a gis) fis gis' fis e dis!(cis b a) gis a' gis fis
  e(dis cis b) a b' a gis fis( e dis cis) b a gis fis
  e8. fis16 fis8. e16 e8\noBeam e'-!\p e-! b-!
  b-! gis-! gis-! e-! e b b r
  R1*4
  r8 fis''\p e dis r e dis cis
  r cis b b ais b r fis'
  eis2 fis4 r8 ais
  b r8 r4 r8 b,16\f cis dis e fis dis
  e( dis\p e gis) e b gis b e, b' gis b e, b' gis b
  e dis e gis e b gis b e, b' gis b e b fis'\f b,
  gis'8 fis a gis fis e b'4(
  b16) e, dis e fis8 e dis16 e fis dis b a' gis fis
  gis8 r fis r e r d r
  cis r dis! r e r r4
  r2 r8 cis\p cis ais
  b4 r r8 dis dis b
  cis4 r r8 e e cis
  dis4 r r2
  r2 r4 r8 fis,\p
  b16 ais b dis b fis dis fis b, fis' dis fis b, fis' dis fis
  b ais b dis b fis dis fis b,8 r r cis'\f
  dis cis e dis cis b fis'4(
  fis16) b, ais b cis8 b ais!16 b cis ais fis e'(dis cis)
  fis, dis'( cis b) fis cis'(b ais) b e,(dis cis) b a'( gis fis)
  gis fis e dis cis dis' cis b ais gis fis e dis e' dis cis
  b ais gis fis e fis' e dis cis b ais! gis fis gis' fis e
  dis8. cis16 cis8. b16 b8 cis b ais
  b4 r dis2\p(
  dis4.) cis16 bis cis4 r
  r2 r8 fis fis dis
  e r8 r4 r r8 gis,\f
  cis16 bis cis e cis gis e gis cis, gis' e gis cis, gis' e gis
  cis bis cis e cis gis e gis cis,8 r r4
  r2 ais''\p(
  ais8) gis r4 r16 gis,\f b dis gis fis e dis
  gis,-! e'(dis cis) gis-! dis'( cis b) cis,-! cis'( b ais) b8 gis'\p
  gis2(gis4.) fisis8\f
  gis8. cis16 ais8. gis16 gis4 r8 b,\p
  e16 dis e gis e b gis b e, b' gis b e, b' gis b
  e dis e gis e b gis b e, b' gis b e b fis'\f b,
  gis'8 fis a gis fis e r b'\p
  b gis gis e e16 d cis b a8 fis'
  fis dis! dis b b16 a gis fis e8 b'
  cis16 e fis gis a8 fis dis16 fis gis a b8 gis
  e dis e cis dis b r16 b cis dis
  e dis e gis e b gis b e, b' gis b e, b' gis b
  e dis e gis e b gis b e, b' gis b e b fis'\f b,
  gis'8 fis a gis fis e b'4(
  b16) e, dis e fis8 e dis16 e fis dis b a' gis fis
  gis8 r r16 fis e dis e8 r r16 d cis b
  cis b a gis fis gis' fis e dis! cis b a gis a' gis fis
  e dis cis b a b' a gis fis e dis cis b a gis fis
  e8. fis16 fis8. e16 e4 r
  
  % Middle part
  r2 r8 cis'\p cis,4
  r2 r8 cis' cis,4
  r2 r8 cis' cis,4
  r2 r8 cis' cis,4
  r8 e' d cis r cis b a
  gis4 r r r8 cis\p
  fis16 eis fis a fis cis a cis fis, cis' a cis fis, cis' a cis
  fis eis fis a fis cis a cis fis, cis' a cis fis cis gis' cis,
  a'8 gis b a gis fis cis'4(
  cis16) fis, eis fis gis8 fis eis!4 r8 eis
  fis16 cis d b' eis,8. fis16 fis fis, a cis fis e d! cis
  fis, d'( cis b) fis cis'(b a) eis b'(a gis) a8 a'(
  a) gis4 fis8(fis) eis fis gis16\f eis!
  fis8. gis16 eis8. fis16 fis4 r
  r gis8\p r r4 fis8 r
  r4 e8 r dis r r4
  r2 b(
  b8) a fis'4(fis8) e r gis,
  a16 gis a cis a e cis e a, e' cis e a, e' cis e
  a gis a cis a e cis e a, e' cis e a e b' e,
  cis'8 b d cis b a e'4(
  e16) fis gis a gis fis e\f d cis b a gis fis g' fis e
  d cis b a gis! fis e d cis8 a' b, gis'
  a16\p(cis) cis(eis) eis(fis) fis(gis) gis4 r
  r16 cis, dis e! fis bis, cis dis fis,8 r r4
  gis'1(
  gis2)(gis8)r r4
  r gis(gis8) fis4 e8(
  e16) cis bis cis dis8 gis(gis) e cis fis
  dis bis gis r r4 r8 gis\p
  cis16 bis cis e cis gis e gis cis, gis' e gis cis, gis' e gis
  b! a b d b gis eis gis cis, cis' a cis fis cis gis' cis,
  a'1
  gis1(
  gis4) r8 gis gis, ais bis cis
  d2 cis
  c b4. gis'8
  cis, r fis r fis r e r
  dis r cis r dis r cis r
  bis dis dis fis bis, dis dis fis
  e r r4 r16 cis, e gis cis b! a gis
  cis,-! a'(gis fis) cis-! gis'(fis e) bis-! fis'(e dis) e8 e'(
  e) dis4 cis8(cis) bis cis e
  fis r gis r cis, r r fis
  gis r a r dis, r r gis
  a r b r e, r r a
  a(gis) gis(fis) fis(e) e(dis)
  dis r r e e(dis) r fis
  fis(e) r gis gis(fis) r a
  a16(fis) gis8-! gis16(e) fis8-! fis r r4
  r4 \tempo "Adagio" bis, cis4. \tempo "Tempo primo" b8\f

  % Repeat of measure 1 till 62
  e16(dis e gis) e b gis b e, b' gis b e, b' gis b
  e(dis e gis) e b gis b e, b' gis b e b fis' b,
  gis'8-. \schleifer fis-. a-. gis-. fis\trill e b'4(
  b16) e, dis e fis8 e dis16 e fis dis b-! a'( gis fis)
  b,-! gis'( fis e) b-! fis'( e dis) e-! a,( gis fis) e-! d'( cis b)
  cis( b a gis) fis gis' fis e dis!(cis b a) gis a' gis fis
  e(dis cis b) a b' a gis fis( e dis cis) b a gis fis
  e8. fis16 fis8. e16 e8\noBeam e'-!\p e-! b-!
  b-! gis-! gis-! e-! e b b r
  R1*4
  r8 fis''\p e dis r e dis cis
  r cis b b ais b r fis'
  eis2 fis4 r8 ais
  b r8 r4 r8 b,16\f cis dis e fis dis
  e( dis\p e gis) e b gis b e, b' gis b e, b' gis b
  e dis e gis e b gis b e, b' gis b e b fis'\f b,
  gis'8 fis a gis fis e b'4(
  b16) e, dis e fis8 e dis16 e fis dis b a' gis fis
  gis8 r fis r e r d r
  cis r dis! r e r r4
  r2 r8 cis\p cis ais
  b4 r r8 dis dis b
  cis4 r r8 e e cis
  dis4 r r2
  r2 r4 r8 fis,\p
  b16 ais b dis b fis dis fis b, fis' dis fis b, fis' dis fis
  b ais b dis b fis dis fis b,8 r r cis'\f
  dis cis e dis cis b fis'4(
  fis16) b, ais b cis8 b ais!16 b cis ais fis e'(dis cis)
  fis, dis'( cis b) fis cis'(b ais) b e,(dis cis) b a'( gis fis)
  gis fis e dis cis dis' cis b ais gis fis e dis e' dis cis
  b ais gis fis e fis' e dis cis b ais! gis fis gis' fis e
  dis8. cis16 cis8. b16 b8 cis b ais
  b4 r dis2\p(
  dis4.) cis16 bis cis4 r
  r2 r8 fis fis dis
  e r8 r4 r r8 gis,\f
  cis16 bis cis e cis gis e gis cis, gis' e gis cis, gis' e gis
  cis bis cis e cis gis e gis cis,8 r r4
  r2 ais''\p(
  ais8) gis r4 r16 gis,\f b dis gis fis e dis
  gis,-! e'(dis cis) gis-! dis'( cis b) cis,-! cis'( b ais) b8 gis'\p
  gis2(gis4.) fisis8\f
  gis8. cis16 ais8. gis16 gis4 r8 b,\p
  e16 dis e gis e b gis b e, b' gis b e, b' gis b
  e dis e gis e b gis b e, b' gis b e b fis'\f b,
  gis'8 fis a gis fis e r b'\p
  b gis gis e e16 d cis b a8 fis'
  fis dis! dis b b16 a gis fis e8 b'
  cis16 e fis gis a8 fis dis16 fis gis a b8 gis
  e dis e cis dis b r16 b cis dis
  e dis e gis e b gis b e, b' gis b e, b' gis b
  e dis e gis e b gis b e, b' gis b e b fis'\f b,
  gis'8 fis a gis fis e b'4(
  b16) e, dis e fis8 e dis16 e fis dis b a' gis fis
  gis8 r r16 fis e dis e8 r r16 d cis b
  cis b a gis fis gis' fis e dis! cis b a gis a' gis fis
  e dis cis b a b' a gis fis e dis cis b a gis fis
  e8. fis16 fis8. e16 e4 r8
  \bar "|."
}

scoreAViolinII = \relative c'' {
  \global
  r8
  r8 b gis e r b' gis e
  r b' gis e r e' b dis
  e fis e e dis e r e16 dis
  e8 gis dis e a, cis fis, dis'
  e r fis, r gis r b gis
  a e cis'16 b a gis fis8 dis'(dis16) cis b a
  gis8 e'(e16) dis cis b a gis fis e dis cis b a
  gis8 e'(e) dis e\noBeam b'\p b gis
  gis e e b b gis gis r
  R1*4
  r8 dis''\p ais b r cis gis ais!
  r fis b, fis' fis fis r fis
  cis'2 cis4 r8 fis
  fis r r4 r8 fis,\f b dis
  gis, e\p e b b b b r
  r2 r4 r8 dis'\f
  e fis e e dis e r e16 dis
  e8 gis dis e a, cis fis, b
  b r b r cis r b r
  a r a r gis r r4
  r2 r8 ais\p ais fis
  fis4 r r8 b b gis
  gis4 r r8 cis ais ais
  b4 r r2
  R1
  r8 b\p b fis fis b b b,
  b r r4 r r8 ais'\f
  b cis b b ais b r b16 ais
  b8 dis ais b e, gis cis, ais'!
  b r cis, r dis r fis dis
  e b gis'16 fis e dis cis8 ais'(ais16) gis fis e
  dis8 b'(b16) ais gis fis e dis' cis b ais! e' dis cis
  b8 b4 ais8 b gis fis e
  dis4 r fis2\p(
  fis4.) gis8 gis4 r
  r2 r8 dis' dis bis
  cis r r4 r r8 dis\f
  e gis e cis r gis e cis
  R1
  r2 cis'\p
  b4 r r r8 b\f
  ais r b r cis r b r
  gis\p r b r cis r dis cis\f
  b gis' gis fisis dis4 r8 e,\p
  e gis gis b b e e r
  r2 r4 r8 dis\f
  e fis e e dis e r fis\p
  gis e e b cis4 r8 cis
  b b b fis gis4 r16 e' dis e
  cis4(cis16)a b cis dis4(dis16)b cis dis
  e8 gis cis, fis fis, b r4
  r8 e e b cis gis' gis e
  e e, gis b e16 dis e dis e8 dis\f
  e fis e e dis e r e16 dis
  e8 gis dis e a, cis fis, fis'
  e16 b a gis fis8 r r16 cis b a b8 r
  r e a cis(cis) fis, b dis(
  dis) gis, cis e fis4 r8 fis
  b, cis cis b b4 r
  r2 r8 cis\p cis,4
  r2 r8 cis' cis,4
  r2 r8 cis' cis,4
  r2 r8 cis' cis,4
  R1*3
  r4 r8 eis' fis cis fis, eis'!
  fis gis fis fis eis fis gis fis
  eis4 r8 d16(b) gis4 r
  r2 r4 r8 a
  b r cis, r eis r fis r
  r2 r4 r8 cis'\f
  fis, d' cis cis cis4 r
  r b8\p r r4 a8 r
  r4 cis8 r ais r r4
  r2 gis
  cis8 fis, b d gis,4 r
  R1*3
  r4 r8 gis\f a2(
  a16) e' d cis b4(b8) a fis e
  e16\p(a) a(b) b(cis) cis(gis) gis4 r8 eis'
  fis4 r8 fis dis!4 r8 cis
  bis r gis bis cis r dis cis
  bis r dis bis cis r r4
  r r8 gis a r gis r
  gis r fis r e gis4 fis8(
  fis) dis e r r2
  gis2\p cis
  b cis4 r8 cis
  cis a a fis fis cis'16 b a gis fis e
  dis8 e fis gis gis4 r8 cis
  bis cis dis cis bis cis dis cis
  b!2(b8) gis cis, a
  a'2(a8) fis b, gis
  a r a' r gis r gis r
  gis r gis r gis r gis r
  gis2.(gis8) dis'
  cis r bis r cis r gis r
  fis r gis r bis r cis r
  cis, r e r fis r e gis
  fis r cis' r a r r bis
  gis r dis' r bis r r cis
  a r e' r cis r r dis
  bis r cis r bis r gis r
  gis r r cis cis(bis) r dis
  dis(cis) r e e(dis) r fis
  fis16(dis) e8-! e16(cis) dis8-! dis r r4
  r \tempo "Adagio" gis,8 fis e4. \tempo "Tempo primo" r8
  % Repeat from begin
  r8 b'\f gis e r b' gis e
  r b' gis e r e' b dis
  e fis e e dis e r e16 dis
  e8 gis dis e a, cis fis, dis'
  e r fis, r gis r b gis
  a e cis'16 b a gis fis8 dis'(dis16) cis b a
  gis8 e'(e16) dis cis b a gis fis e dis cis b a
  gis8 e'(e) dis e\noBeam b'\p b gis
  gis e e b b gis gis r
  R1*4
  r8 dis''\p ais b r cis gis ais!
  r fis b, fis' fis fis r fis
  cis'2 cis4 r8 fis
  fis r r4 r8 fis,\f b dis
  gis, e\p e b b b b r
  r2 r4 r8 dis'\f
  e fis e e dis e r e16 dis
  e8 gis dis e a, cis fis, b
  b r b r cis r b r
  a r a r gis r r4
  r2 r8 ais\p ais fis
  fis4 r r8 b b gis
  gis4 r r8 cis ais ais
  b4 r r2
  R1
  r8 b\p b fis fis b b b,
  b r r4 r r8 ais'\f
  b cis b b ais b r b16 ais
  b8 dis ais b e, gis cis, ais'!
  b r cis, r dis r fis dis
  e b gis'16 fis e dis cis8 ais'(ais16) gis fis e
  dis8 b'(b16) ais gis fis e dis' cis b ais! e' dis cis
  b8 b4 ais8 b gis fis e
  dis4 r fis2\p(
  fis4.) gis8 gis4 r
  r2 r8 dis' dis bis
  cis r r4 r r8 dis\f
  e gis e cis r gis e cis
  R1
  r2 cis'\p
  b4 r r r8 b\f
  ais r b r cis r b r
  gis\p r b r cis r dis cis\f
  b gis' gis fisis dis4 r8 e,\p
  e gis gis b b e e r
  r2 r4 r8 dis\f
  e fis e e dis e r fis\p
  gis e e b cis4 r8 cis
  b b b fis gis4 r16 e' dis e
  cis4(cis16)a b cis dis4(dis16)b cis dis
  e8 gis cis, fis fis, b r4
  r8 e e b cis gis' gis e
  e e, gis b e16 dis e dis e8 dis\f
  e fis e e dis e r e16 dis
  e8 gis dis e a, cis fis, fis'
  e16 b a gis fis8 r r16 cis b a b8 r
  r e a cis(cis) fis, b dis(
  dis) gis, cis e fis4 r8 fis
  b, cis cis b b4 r8
  \bar "|."
  
  
  %?
  %\voiceFour  
}

scoreAViola = \relative c' {
  \global
  r8
  r4 r8 b' gis e r b'
  gis e r b' gis b b, b'
  b b e, gis b b, r b'
  gis b b b, fis' a b b
  b r b r cis r e, e(
  e16) d cis b a8 fis'(fis16) e dis cis b8 gis'(
  gis16) fis e dis cis8 a'(a16) b a gis fis8 e16 dis
  e8 cis b a gis\noBeam gis'\p gis e
  e b b gis gis e e r
  R1*5
  r8 cis'\p e fis fis, b r b'
  b2 ais4 r8 cis
  fis, r r4 r8 dis16\f e fis gis a! fis
  b8 gis\p gis e e gis, gis r
  r2 r4 r8 b'\f
  b b e, gis b b, r b'
  gis b b b, fis' a b dis,
  e r fis r gis r e r
  e r b r b r r4
  r2 r8 fis'\p fis cis
  dis4 r r8 gis gis dis
  e4 r r8 e cis fis
  fis4 r r2
  R1
  r4 r8 b\p b fis fis b
  e, r r4 r r8 fis\f
  fis fis b, dis fis fis, r fis'
  dis fis fis fis, cis' e fis fis
  fis r fis r gis r b, b(
  b16) a gis fis e8 cis'(cis16) b ais gis fis8 dis'(
  dis16) cis b ais gis8 e'(e16) fis e dis cis8 fis
  fis gis fis e dis e dis cis
  b4 r bis2\p(
  bis4.) fis'8 e4 r
  r2 r8 bis' bis gis
  gis r r4 r r8 dis\f
  cis4 r8 gis' e cis r gis
  e cis r4 r2
  r2 fisis'4\p dis(
  dis8) gis r4 r r8 gis\f
  e r dis r cis r dis r
  cis\p r dis r ais' r b dis\f
  gis, e dis ais' b4 r8 gis,\p
  gis b b e e gis gis r
  r2 r4 r8 b\f
  b b e, gis b b r dis,\p
  e b' b gis e4 r8 a
  fis fis fis dis b4 r
  r16 cis dis e fis4(fis16) dis e fis gis4(
  gis8) gis gis cis, b dis r4
  r8 gis gis e e cis' cis gis
  gis b, e gis b b, b' b\f
  b b e, gis b b, r b'
  gis b b b, fis' a b b
  b, r dis r gis, r e'4(
  e) fis2 gis4(
  gis) a8 cis cis(b) r b
  b, e cis fis gis4 r
  r2 r8 cis\p cis,4
  r2 r8 cis' cis,4
  r2 r8 cis' cis,4
  r2 r8 cis' cis,4
  R1*3
  r4 r8 cis cis fis cis b
  a e' b cis gis' a gis cis,
  cis4 r8 b b4 r
  r2 r4 r8 fis'
  fis r fis r gis r cis, r
  r2 r4 r8 b'\f
  a gis gis b a4 r
  r cis,8\p r r4 fis8 r
  r4 gis8 r fisis r r4
  r2 e(
  e8) a(a) b b,4 r
  R1*3
  r4 r8 e\f e4. d16 cis
  b8 fis' gis b e, fis fis b,
  cis16\p(e) e(gis) gis(a) a(b) b4 r8 gis
  fis4 r8 a a4 r8 gis
  gis r cis, gis' gis r gis gis
  dis r gis dis eis r r4
  r4 r8 eis fis r dis r
  cis r gis' r cis, cis cis a'
  gis gis gis r r2
  e1\p
  gis2 fis4 r8 b
  a fis fis cis cis a16 b cis8 cis
  gis' ais bis cis bis4 r8 gis
  gis, ais bis cis gis4 r
  eis' gis(gis8) eis! a fis
  dis4 fis(fis8) dis gis e!16 cis
  fis8 r fis r dis r cis r
  dis r e r fis r e r
  dis2.(dis8) dis
  e a4 gis8 e r cis r
  cis r e r fis r gis r
  fis r gis r gis r gis cis,
  a' r gis r fis r r fis
  e r a r gis r r gis
  cis, r b r a r r fis'
  dis r gis r gis r cis, r
  gis'(fis) e(cis) dis(fis) bis,(dis)
  e(gis) cis,(e) fis(a) dis,(fis)
  gis r gis r bis r r4
  r \tempo "Adagio" gis, gis4. \tempo "Tempo primo" r8
  % Repeat from begin
  r4 r8 b'\f gis e r b'
  gis e r b' gis b b, b'
  b b e, gis b b, r b'
  gis b b b, fis' a b b
  b r b r cis r e, e(
  e16) d cis b a8 fis'(fis16) e dis cis b8 gis'(
  gis16) fis e dis cis8 a'(a16) b a gis fis8 e16 dis
  e8 cis b a gis\noBeam gis'\p gis e
  e b b gis gis e e r
  R1*5
  r8 cis'\p e fis fis, b r b'
  b2 ais4 r8 cis
  fis, r r4 r8 dis16\f e fis gis a! fis
  b8 gis\p gis e e gis, gis r
  r2 r4 r8 b'\f
  b b e, gis b b, r b'
  gis b b b, fis' a b dis,
  e r fis r gis r e r
  e r b r b r r4
  r2 r8 fis'\p fis cis
  dis4 r r8 gis gis dis
  e4 r r8 e cis fis
  fis4 r r2
  R1
  r4 r8 b\p b fis fis b
  e, r r4 r r8 fis\f
  fis fis b, dis fis fis, r fis'
  dis fis fis fis, cis' e fis fis
  fis r fis r gis r b, b(
  b16) a gis fis e8 cis'(cis16) b ais gis fis8 dis'(
  dis16) cis b ais gis8 e'(e16) fis e dis cis8 fis
  fis gis fis e dis e dis cis
  b4 r bis2\p(
  bis4.) fis'8 e4 r
  r2 r8 bis' bis gis
  gis r r4 r r8 dis\f
  cis4 r8 gis' e cis r gis
  e cis r4 r2
  r2 fisis'4\p dis(
  dis8) gis r4 r r8 gis\f
  e r dis r cis r dis r
  cis\p r dis r ais' r b dis\f
  gis, e dis ais' b4 r8 gis,\p
  gis b b e e gis gis r
  r2 r4 r8 b\f
  b b e, gis b b r dis,\p
  e b' b gis e4 r8 a
  fis fis fis dis b4 r
  r16 cis dis e fis4(fis16) dis e fis gis4(
  gis8) gis gis cis, b dis r4
  r8 gis gis e e cis' cis gis
  gis b, e gis b b, b' b\f
  b b e, gis b b, r b'
  gis b b b, fis' a b b
  b, r dis r gis, r e'4(
  e) fis2 gis4(
  gis) a8 cis cis(b) r b
  b, e cis fis gis4 r8
  \bar "|."
}

scoreABcMusic = \relative c {
  \global
  e8
  e,4 r8 e' e,4 r8 e'
  e,4 r8 e' e, e' gis b
  e dis cis b a gis r gis
  cis b a gis fis e dis b
  e r dis r cis r gis e
  a cis fis a
  b, dis gis b
  cis, e a cis dis, fis b b,
  cis a b b e,4 r
  R1*5
  r2 r4 r8 fis'\p
  b ais gis fis e dis r d
  cis gis' eis cis e4 r8 e
  dis r r4 r8 b'16\f a gis8 fis
  gis r r4 r8 b16\p a gis fis e dis
  e8 r r4 r r8 b'\f
  e dis cis b a gis r gis
  cis b a gis fis e dis b
  e r dis r cis r gis r
  a r b r e, r r4
  r2 r8 e'\p e e
  dis4 r r8 fis fis fis
  e4 r r8 cis fis fis,
  b r r4 r2
  R1*2
  r2 r4 r8 fis'\f
  b ais gis fis e dis r dis
  gis fis e dis cis b ais fis
  b r ais r gis r dis b'
  e, gis cis e
  fis, ais dis fis
  gis, b e gis
  ais, cis fis ais
  b e, fis fis, b4 r
  R1*3
  r2 r4 r8 fis'\f
  e4 r8 gis cis4 r8 gis
  cis gis e cis a r r a'\p
  gis fis gis gis, dis'4 r8 fisis
  gis e cis dis gis, gis'16 ais b8 gis\f
  cis r b r ais r gis r
  cis,\p r b r ais r gis dis'\f
  e cis dis dis, gis4 r
  e\p r8 e' e,4 r8 e'
  e,4 r8 e' e, e' gis b\f
  e dis cis b a gis r16 gis\p a b
  e,8 e' r16 e, fis gis a8 a, r16 fis' gis a
  dis,8 b' r16 b, cis dis e8 e, r16 e' fis gis
  a8 a, r16 fis' gis a b8 b, r16 gis' a b
  cis8 b cis ais b a gis fis
  e e' r e,16 dis cis8 cis' r16 cis, b a
  gis8 gis' r gis,16 fis e8 e' gis b\f
  e dis cis b a gis r gis
  cis b a gis fis e dis b
  e r dis r cis r gis e
  a cis a fis b dis b gis
  cis e cis a dis,4 r8 dis'
  e cis a b e,4 r
  % Begin middle part
  r2 cis'4\p r
  r2 cis4 r
  fis8 r gis r a r b r
  a r cis r fis, cis r4
  R1*3
  r8 fis, a cis fis4 r8 fis,
  fis' e d cis b a eis fis
  b4 r8 gis cis4 r
  r2 r8 fis,16 gis a8 fis
  b r a r gis r fis r
  r2 r4 r8 cis'\f
  d b cis cis, fis4 r
  R1*2
  r2 r8 b'\p gis e
  a fis d b e b gis e
  a4 r r2
  R1*2
  r4 r8 e\f a cis fis a
  b, d e gis a fis d e
  a,\p a' gis fis eis4 r8 cis
  fis4 r8 fis bis,4 r8 cis
  gis r e gis cis r bis cis
  dis r bis gis cis r r4
  r r8 cis fis r gis r
  a r bis, r cis e fis dis
  gis gis, cis r r4 r8 gis'\p
  cis, e e gis gis b b d
  d b gis cis a cis16 b a gis fis eis
  fis8 cis cis a a16 b a gis fis8 fis'(
  fis) e! dis cis gis ais bis cis
  gis4 r gis r
  gis'8(gis) eis(eis) cis(cis) a(a)
  fis'(fis) dis(dis) b(b) gis cis
  a r fis r gis r gis r
  gis r gis r r gis' e cis
  gis bis bis dis dis fis fis bis,
  cis a fis gis a r eis' r
  fis r e! r dis r cis r
  fis r e r dis r cis cis
  dis dis eis eis fis r r dis
  e! e fis fis gis r r e
  fis fis gis gis a16(gis a fis) dis(cis dis bis)
  gis1(
  gis)(
  gis)(
  gis2)(gis8) r r4
  r \tempo "Adagio" gis cis4. \tempo "Tempo primo" e8\f
  % Repeat from begin until middle part
  e,4 r8 e' e,4 r8 e'
  e,4 r8 e' e, e' gis b
  e dis cis b a gis r gis
  cis b a gis fis e dis b
  e r dis r cis r gis e
  a cis fis a
  b, dis gis b
  cis, e a cis dis, fis b b,
  cis a b b e,4 r
  R1*5
  r2 r4 r8 fis'\p
  b ais gis fis e dis r d
  cis gis' eis cis e4 r8 e
  dis r r4 r8 b'16\f a gis8 fis
  gis r r4 r8 b16\p a gis fis e dis
  e8 r r4 r r8 b'\f
  e dis cis b a gis r gis
  cis b a gis fis e dis b
  e r dis r cis r gis r
  a r b r e, r r4
  r2 r8 e'\p e e
  dis4 r r8 fis fis fis
  e4 r r8 cis fis fis,
  b r r4 r2
  R1*2
  r2 r4 r8 fis'\f
  b ais gis fis e dis r dis
  gis fis e dis cis b ais fis
  b r ais r gis r dis b'
  e, gis cis e
  fis, ais dis fis
  gis, b e gis
  ais, cis fis ais
  b e, fis fis, b4 r
  R1*3
  r2 r4 r8 fis'\f
  e4 r8 gis cis4 r8 gis
  cis gis e cis a r r a'\p
  gis fis gis gis, dis'4 r8 fisis
  gis e cis dis gis, gis'16 ais b8 gis\f
  cis r b r ais r gis r
  cis,\p r b r ais r gis dis'\f
  e cis dis dis, gis4 r
  e\p r8 e' e,4 r8 e'
  e,4 r8 e' e, e' gis b\f
  e dis cis b a gis r16 gis\p a b
  e,8 e' r16 e, fis gis a8 a, r16 fis' gis a
  dis,8 b' r16 b, cis dis e8 e, r16 e' fis gis
  a8 a, r16 fis' gis a b8 b, r16 gis' a b
  cis8 b cis ais b a gis fis
  e e' r e,16 dis cis8 cis' r16 cis, b a
  gis8 gis' r gis,16 fis e8 e' gis b\f
  e dis cis b a gis r gis
  cis b a gis fis e dis b
  e r dis r cis r gis e
  a cis a fis b dis b gis
  cis e cis a dis,4 r8 dis'
  e cis a b e,4 r8
  \bar "|."
}
