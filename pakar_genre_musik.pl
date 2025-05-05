% DATABASE
:- dynamic karakteristik_pos/1.
:- dynamic karakteristik_neg/1.

% GENRE MUSIK
genre("Pop").
genre("Rock").
genre("Jazz").
genre("Hip Hop").
genre("Klasik").
genre("EDM").
genre("Reggae").
genre("Country").

% KARAKTERISTIK PER GENRE
karakteristik(melodi_mudah_diingat, "Pop").
karakteristik(lirik_romantis, "Pop").
karakteristik(ritme_dan_tempo_stabil, "Pop").
karakteristik(instrumen_elektronik_ringan, "Pop").

karakteristik(gitar_distorsi, "Rock").
karakteristik(tempo_enerjik, "Rock").
karakteristik(vokal_keras, "Rock").
karakteristik(tema_pemberontakan, "Rock").

karakteristik(improvisasi, "Jazz").
karakteristik(instrumen_tiupan, "Jazz").
karakteristik(ritme_kompleks, "Jazz").
karakteristik(suasana_santai, "Jazz").

karakteristik(beat_kuat, "Hip Hop").
karakteristik(rap_vokal, "Hip Hop").
karakteristik(lirik_kritis_sosial, "Hip Hop").
karakteristik(sampling_musik, "Hip Hop").

karakteristik(instrumen_orkestra, "Klasik").
karakteristik(tidak_ada_vokal, "Klasik").
karakteristik(struktur_kompleks, "Klasik").
karakteristik(suasana_formal, "Klasik").

karakteristik(beat_dance, "EDM").
karakteristik(ritme_cepat, "EDM").
karakteristik(dominasi_sintesis, "EDM").
karakteristik(minim_vokal, "EDM").

karakteristik(ritme_syncopated, "Reggae").
karakteristik(vokal_santai, "Reggae").
karakteristik(tema_kedamaian, "Reggae").
karakteristik(bass_dominan, "Reggae").

karakteristik(gitar_akustik, "Country").
karakteristik(cerita_naratif, "Country").
karakteristik(vokal_nasally, "Country").
karakteristik(tema_kehidupan_desa, "Country").

% PERTANYAAN
pertanyaan(melodi_mudah_diingat, Y) :- Y = "Apakah Anda suka lagu dengan melodi yang mudah diingat?".
pertanyaan(lirik_romantis, Y) :- Y = "Apakah Anda menyukai lirik lagu yang romantis?".
pertanyaan(ritme_dan_tempo_stabil, Y) :- Y = "Apakah Anda menyukai ritme dan tempo yang stabil?".
pertanyaan(instrumen_elektronik_ringan, Y) :- Y = "Apakah Anda menyukai musik dengan instrumen elektronik ringan?".

pertanyaan(gitar_distorsi, Y) :- Y = "Apakah Anda menyukai suara gitar yang distorsi?".
pertanyaan(tempo_enerjik, Y) :- Y = "Apakah Anda menyukai musik dengan tempo yang enerjik?".
pertanyaan(vokal_keras, Y) :- Y = "Apakah Anda menyukai vokal yang keras?".
pertanyaan(tema_pemberontakan, Y) :- Y = "Apakah Anda tertarik dengan tema pemberontakan dalam lagu?".

pertanyaan(improvisasi, Y) :- Y = "Apakah Anda menyukai improvisasi dalam musik?".
pertanyaan(instrumen_tiupan, Y) :- Y = "Apakah Anda menyukai suara dari instrumen tiupan?".
pertanyaan(ritme_kompleks, Y) :- Y = "Apakah Anda menyukai ritme musik yang kompleks?".
pertanyaan(suasana_santai, Y) :- Y = "Apakah Anda menyukai musik dengan suasana santai?".

pertanyaan(beat_kuat, Y) :- Y = "Apakah Anda menyukai musik dengan beat yang kuat?".
pertanyaan(rap_vokal, Y) :- Y = "Apakah Anda menyukai lagu dengan vokal rap?".
pertanyaan(lirik_kritis_sosial, Y) :- Y = "Apakah Anda tertarik dengan lirik yang mengkritik isu sosial?".
pertanyaan(sampling_musik, Y) :- Y = "Apakah Anda menyukai musik dengan teknik sampling?".

pertanyaan(instrumen_orkestra, Y) :- Y = "Apakah Anda menyukai musik dengan instrumen orkestra?".
pertanyaan(tidak_ada_vokal, Y) :- Y = "Apakah Anda lebih suka musik tanpa vokal?".
pertanyaan(struktur_kompleks, Y) :- Y = "Apakah Anda menyukai struktur musik yang kompleks?".
pertanyaan(suasana_formal, Y) :- Y = "Apakah Anda menikmati musik yang formal dan terstruktur?".

pertanyaan(beat_dance, Y) :- Y = "Apakah Anda menyukai musik yang membuat Anda ingin menari?".
pertanyaan(ritme_cepat, Y) :- Y = "Apakah Anda menyukai ritme yang cepat?".
pertanyaan(dominasi_sintesis, Y) :- Y = "Apakah Anda menyukai suara dari sintesis elektronik?".
pertanyaan(minim_vokal, Y) :- Y = "Apakah Anda menyukai musik dengan vokal yang sedikit atau tidak ada?".

pertanyaan(ritme_syncopated, Y) :- Y = "Apakah Anda menyukai ritme yang syncopated (terpotong-potong)?".
pertanyaan(vokal_santai, Y) :- Y = "Apakah Anda menyukai vokal yang santai dan mengalir?".
pertanyaan(tema_kedamaian, Y) :- Y = "Apakah Anda menyukai lagu dengan tema kedamaian?".
pertanyaan(bass_dominan, Y) :- Y = "Apakah Anda menyukai musik dengan bass yang dominan?".

pertanyaan(gitar_akustik, Y) :- Y = "Apakah Anda menyukai suara gitar akustik?".
pertanyaan(cerita_naratif, Y) :- Y = "Apakah Anda menyukai lagu yang menceritakan kisah?".
pertanyaan(vokal_nasally, Y) :- Y = "Apakah Anda menyukai vokal yang terdengar nasal?".
pertanyaan(tema_kehidupan_desa, Y) :- Y = "Apakah Anda menyukai lagu dengan tema kehidupan pedesaan?".
