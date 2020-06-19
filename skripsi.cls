%%% File `skripsi.cls' merupakan modifikasi 'disertasi.cls' ditujukan untuk menulis skripsi
%%% menggunakan LaTeX untuk program Sarjana
%%% di Universitas Islam Negeri Maulana Malik Ibrahim Malang,
%%% berdasarkan pedoman penulisan skripsi UIN Maliki Malang Jurusan Matematika tahun 2014
%%%
%%% File ini berisi makro-makro LaTeX untuk memudahkan
%%% penulisan skripsi dengan format sesuai ketentuan SPS UIN Maliki Malang.
%%% Kelas utama yang digunakan adalah `skripsi.cls', dan dengan
%%% demikian semua perintah (untuk penyesuaian) yang berlaku
%%% di kelas 'skripsi', bila perlu, masih dapat digunakan.
%%% Author: Yunus (ITB) <yunusm@matematika.its.ac.id>
%% Copyright: Yunus 2008
%%% 

\ProvidesClass{skripsi}[08/08/08 v1.01]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[a4paper,12pt,oneside,final]{book}
\RequirePackage{calc}
\RequirePackage{nohyperref}
\RequirePackage[hang]{caption}
\RequirePackage{minitoc}
%\RequirePackage[tight,french]{fancynum}

%----------------------------------------------------------
\DeclareRobustCommand{\Judul}[1]{%
    \newcommand{\@judul}{#1}%
    \title{\@judul}}%
\DeclareRobustCommand{\Nama}[1]{%
   \newcommand{\@nama}{#1}%
   \author{\@nama}}%
\DeclareRobustCommand{\NamaBalik}[1]{%
   \DeclareRobustCommand{\@namabalik}{#1}}%
\DeclareRobustCommand{\Nim}[1]{%
   \DeclareRobustCommand{\@nim}{#1}}%
\DeclareRobustCommand{\Kajur}[1]{%
   \DeclareRobustCommand{\@kajur}{#1}}%
\newcommand\@progstudi{Matematika}
\DeclareRobustCommand\ProgStudi[1]{%
   \renewcommand\@progstudi{#1}}%
\newcommand\@tahun{2020}
\DeclareRobustCommand\Tahun[1]{%
   \renewcommand\@tahun{#1}}%
\newcommand\@nippbsatu{}
\newcommand\@nippbdua{}
\newcommand\@nipkajur{}
\DeclareRobustCommand\Nip[3]{%
   \renewcommand{\@nippbsatu}{#1}%
   \renewcommand{\@nippbdua}{#2}%
   \renewcommand{\@nipkajur}{#3}}%
\newcommand\@pbbsatu{}
\newcommand\@pbbdua{}
\DeclareRobustCommand\Pembimbing[2]{%
   \renewcommand{\@pbbsatu}{#1}%
   \renewcommand{\@pbbdua}{#2}}%
\DeclareRobustCommand{\PengujiUtama}[1]{%
   \DeclareRobustCommand{\@pgjsatu}{#1}}%
\DeclareRobustCommand{\KetuaPenguji}[1]{%
   \DeclareRobustCommand{\@pgjdua}{#1}}%
\newcommand\@tanggalsetuju{\today}
\DeclareRobustCommand\TanggalDisetujui[1]{%
   \renewcommand\@tanggalsetuju{#1}}%
\DeclareRobustCommand\TanggalPengesahan[1]{%
   \newcommand\@tanggalsah{#1}}%
\DeclareRobustCommand{\JudulEng}[1]{%
    \newcommand{\@judulEng}{#1}}%
\newcommand\@kkindo{}
\newcommand\@kking{}
\newcommand\@kkarab{}
\DeclareRobustCommand{\KataKunci}[3]{%
    \renewcommand{\@kkindo}{#1}%
    \renewcommand{\@kking}{#2}%
    \renewcommand{\@kkarab}{#3}%
}%
%%%----atur spasi -----------------------------------------------------
\newcommand{\displayskipstretch}{\baselinestretch}

\newcommand{\setstretch}[1]{%
  \def\baselinestretch{#1}%
  \@currsize
}

\newcommand{\SetSinglespace}[1]{%
  \def\setspace@singlespace{#1}%
}
\SetSinglespace{1}
\newcommand{\singlespacing}{%
  \setstretch {\setspace@singlespace}%
  \vskip \baselineskip  %
}
\newcommand{\onehalfspacing}{%
  \setstretch{1.25}%  default
  \ifcase \@ptsize \relax % 10pt
    %\setstretch {1.44}%
    \setstretch {1.3}%
  \or % 11pt
    %\setstretch {1.423}%
    \setstretch {1.275}%
  \or % 12pt
    %\setstretch {1.441}%
    \setstretch {1.31}%
  \fi
}
\newcommand{\doublespacing}{%
  \setstretch {1.667}%  default
  \ifcase \@ptsize \relax % 10pt
    \setstretch {1.667}%
  \or % 11pt
    \setstretch {1.618}%
  \or % 12pt
    \setstretch {1.655}%
  \fi
}

\def\@setsize#1#2#3#4{%
  \@nomath#1%
  \let\@currsize#1%
  \baselineskip #2%
  \baselineskip \baselinestretch\baselineskip
  \parskip \baselinestretch\parskip
  \setbox\strutbox \hbox{%
    \vrule height.7\baselineskip
           depth.3\baselineskip
           width\z@}%
  \skip\footins \baselinestretch\skip\footins
  \normalbaselineskip\baselineskip#3#4}

\let\latex@xfloat=\@xfloat
\def\@xfloat #1[#2]{%
  \latex@xfloat #1[#2]%
  \def\baselinestretch{\setspace@singlespace}%
  \normalsize
}

\long\def\@footnotetext#1{%
  \insert\footins{%
    \def\baselinestretch {\setspace@singlespace}%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth
    \@parboxrestore
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}
\everydisplay\expandafter{%
  \the\everydisplay
  \abovedisplayskip \displayskipstretch\abovedisplayskip
  \belowdisplayskip \displayskipstretch\belowdisplayskip
  \abovedisplayshortskip \displayskipstretch\abovedisplayshortskip
  \belowdisplayshortskip \displayskipstretch\belowdisplayshortskip
}
\newcommand\HalamanJudul{%---------------------------
  \pagenumbering{roman}
  \thispagestyle{empty}
  \singlespacing
  \addtocontents{toc}{\protect{\vspace*{1ex}}}
  \addcontentsline{toc}{chapter}{HALAMAN JUDUL}
  \null
  \begin{center}%
    {\normalsize\bfseries{\MakeUppercase{\@judul}}\par}%
    \vskip 2cm%
    {\normalsize\bfseries SKRIPSI} \par
    \vskip 2cm%
    {\normalsize\bfseries OLEH}\\
    {\normalsize\bfseries\MakeUppercase{\@nama} \\
     NIM. \@nim }\par
    \vskip 3cm%
    \includegraphics[height=4cm]{LogoUIN}\par
    \vskip 3cm%
    {\normalsize\bfseries \MakeUppercase{\@progstudi}} \\
    {\normalsize\bfseries
     FAKULTAS SAINS DAN TEKNOLOGI\\ UNIIVERSITAS ISLAM NEGERI MAULANA MALIK IBRAHIM MALANG\\
     \@tahun}
  \end{center}
}
\newcommand{\garis}{\rule{6cm}{0.4pt}}
\RequirePackage{tabularx}

\newcommand\HalamanPengajuan{%-------------------------  
  \newpage
  \thispagestyle{empty}
  \singlespacing
  \addcontentsline{toc}{chapter}{HALAMAN PENGAJUAN}
  \null
  \begin{center}%
    {\normalsize\bfseries{\MakeUppercase{\@judul}}\par}%
    \vskip 2cm%
    {\normalsize\bfseries SKRIPSI} \par
    \vskip 2cm%
    {\normalsize\bfseries Diajukan kepada\\ Fakultas Sains dan Teknologi\\ Universitas Islam Negeri Maulana Malik Ibrahim Malang\\ untuk Memenuhi Salah Satu Persyaratan dalam Memperoleh Gelar Sarjana Sains (S.Si)} \par 
    \vskip 3.5cm%
    {\normalsize\bfseries OLEH}\\
    {\normalsize\bfseries\MakeUppercase{\@nama} \\
     NIM. \@nim }\par
    \vskip 3.5cm%
    {\normalsize\bfseries \MakeUppercase{\@progstudi}} \\
    {\normalsize\bfseries
     FAKULTAS SAINS DAN TEKNOLOGI\\ UNIIVERSITAS ISLAM NEGERI MAULANA MALIK IBRAHIM MALANG\\
     \@tahun}
  \end{center}
}

\RequirePackage{tabularx}
\newcommand\HalamanPersetujuan{%-------------------------
  \newpage
  \thispagestyle{empty}
  \singlespacing
  \addcontentsline{toc}{chapter}{HALAMAN PERSETUJUAN}
  \null
  \begin{center}%
    {\normalsize\bfseries{\MakeUppercase{\@judul}}\par}%
    \vskip 2cm%
    {\normalsize\bfseries SKRIPSI} \par
    \vskip 2.5cm%
    {\normalsize\bfseries Oleh}\\
    {\normalsize\bfseries\MakeUppercase{\@nama} \\
     NIM. \@nim }\par
    \vskip 3cm%
    {\normalsize Telah Diperiksa dan Disetujui untuk Diuji\\ Tanggal \@tanggalsetuju} \par
    \SetujuTiga
  \end{center}
}
\newcommand\SetujuTiga{%
    \begin{tabularx}{\textwidth}{cXc}
    Pembimbing I,  && Pembimbing II, \\
    \rule{0pt}{2cm}
    \@pbbsatu && \@pbbdua\\
    NIP. \@nippbsatu && NIP. \@nippbdua
    \end{tabularx}
    \vskip .5cm%
    Mengetahui,\\Ketua Jurusan Matematika \par
    \vskip 2cm%
    \@kajur\\
    NIP. \@nipkajur \par
    \vskip .5cm}

\RequirePackage{tabularx}
\newcommand\HalamanPengesahan{%-------------------------  
  \newpage
  \thispagestyle{empty}
  \singlespacing
  \addcontentsline{toc}{chapter}{HALAMAN PENGESAHAN}
  \null
  \begin{center}%
    {\normalsize\bfseries{\MakeUppercase{\@judul}}\par}%
    \vskip 2cm%
    {\normalsize\bfseries SKRIPSI} \par
    \vskip 2.5cm%
    {\normalsize\bfseries Oleh}\\
    {\normalsize\bfseries\MakeUppercase{\@nama} \\
     NIM. \@nim }\par
    \vskip 2.5cm%
    {\normalsize Telah Dipertahankan di Depan Dewan Penguji Skripsi\\ dan Dinyatakan Diterima Sebagai Salah Satu Persyaratan\\ untuk Memperoleh Gelar Sarjana Sains (S.Si)\\ Tanggal \@tanggalsah} \par
    \begin{tabular}{llll}
    Penguji Utama &: &\@pgjsatu &........\\
    Ketua Penguji &: &\@pgjdua &........\\
    Sekertaris Penguji &: &\@pbbsatu &........\\
    Anggota Penguji &: &\@pbbdua &........
    \end{tabular}\par
    \vskip .5cm%
    \SahKajur
  \end{center}
}
\newcommand\SahKajur{%
    Mengetahui,\\Ketua Jurusan Matematika \par
    \vskip 2cm%
    \@kajur\\
    NIP. \@nipkajur \par
    \vskip .5cm}

\RequirePackage{tabularx}
\newcommand\HalamanKeaslian{%
  \newpage
  \thispagestyle{empty}
  \doublespacing
  \addcontentsline{toc}{chapter}{HALAMAN PERNYATAAN KEASLIAN TULISAN}
  \null
  \begin{center}%
  {\normalsize\bfseries PERNYATAAN KEASLIAN TULISAN}
  \end{center} \par
  {\normalsize Saya yang bertanda tangan di bawah ini:} \par
  \begin{tabular}{llp{9cm}}
  Nama &: &\@nama\\
  NIM &: &\@nim\\
  Jurusan &: &\@progstudi\\
  Fakultas &: &Sains dan Teknologi\\
  Judul Skripsi &: &\@judul
  \end{tabular}\par
  {\normalsize menyatakan dengan sebenarnya bahwa skripsi yang saya tulis ini benar-benar merupakan hasil karya sendiri, bukan merupakan pengambilan data, tulisan, atau pikiran orang lain yang saya akui sebagai hasil tulisan atau pikiran saya sendiri, kecuali dengan mencantumkan sumber cuplikan pada daftar pustaka. Apabila dikemudian hari terbukti atau dapat dibuktikan skripsi ini hasil jiplakan, maka saya bersedia menerima sanksi atas perbuatan tersebut.} \par
\vskip 1cm%  
\begin{flushright}%
\begin{tabular}{l}
Malang,........\\
Yang membuat pernyataan,\\
\rule{0pt}{2cm}
\@nama \\
NIM. \@nim
\end{tabular}
\end{flushright}
}

\newcommand\Moto{%---------------------
\newpage
\thispagestyle{empty}
\doublespacing
\addcontentsline{toc}{chapter}{HALAMAN MOTO}
\begin{center}
    \normalsize
    \bfseries
    MOTO
    \par
\end{center}
\vskip2em
Halaman motto tetap mengikuti kaidah ilmiah dan mencerminkan sebagai bagian dari karya ilmiah. Halaman moto tidak diperbolehkan memuat latar belakang apapun dan tulisan tidak boleh berwarna selain hitam. Moto dapat berupa moto hidup penulis atau moto penulisan skripsi. Moto dapat dikutip dari tulisan orang lain dengan mencantumkan penulisnya. Skripsi memuat paling banyak 2 (dua) moto. Moto ditulis menggunakan spasi ganda.
}

\newcommand\Persembahan{%---------------------
\newpage
\thispagestyle{empty}
\doublespacing
\addcontentsline{toc}{chapter}{HALAMAN PERSEMBAHAN}
\begin{center}
    \normalsize
    \bfseries
    PERSEMBAHAN
    \par
\end{center}
\vskip2em
Halaman persembahan tetap mengikuti kaidah ilmiah dan mencerminkan sebagai bagian dari karya ilmiah. Halaman persembahan tidak diperbolehkan memuat latar belakang apapun dan tulisan tidak boleh berwarna selain hitam. Persembahan diberikan untuk orang-orang yang sangat khusus misalnya orang tua, saudara, atau suami/istri jika ada.
}

\newcommand\KataPengantar{%---------------------
\newpage
\doublespacing
\addcontentsline{toc}{chapter}{KATA PENGANTAR}
\begin{center}
    \normalsize
    \bfseries
    KATA PENGANTAR
    \par
\end{center}
\vskip2em
Kata pengantar umumnya mengungkapkan tujuan penyusunan tugas akhir/skripsi, ucapan terima kasih, harapan-harapan, sertahal-hal lain yang dianggap perlu oleh penulis. Nama-nama yang disebutkan pada kata pengantar harus lengkap dan tidak boleh menggunakan nama panggilan, sapaan, nama keren, alias, atau lainnya yang kurang sopan. Nama Rektor, Dekan, Ketua Jurusan, dan dosen pembimbing merupakan nama-nama yang menempati urutan awal ucapan terima kasih.
}

\renewcommand\thechapter {\@Roman\c@chapter}
\renewcommand\thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\renewcommand\theequation{\@arabic\c@chapter.\@arabic\c@equation}

\newenvironment{Abstrak}{%-------------------------------
  \newpage
  \singlespacing
  \addcontentsline{toc}{chapter}{ABSTRAK}
  \null
  \begin{center}%
    \normalsize\bfseries ABSTRAK \par
    \par
  \end{center}
\vskip 2ex%
\hangindent=1.27cm
\@namabalik. \@tahun. {\bfseries\@judul}. Jurusan \@progstudi. Fakultas Sains dan Teknologi. Universitas Islam Negeri Maulana Malik Ibrahim Malang. Pembimbing: (I) \@pbbsatu. (II) \@pbbdua. \par
    \vskip 2ex%
    {\bfseries Kata kunci: }\@kkindo \par%
    \vskip 1em
  \par
}

\newenvironment{Abstract}{%------------------------------
  \newpage
  \singlespacing
  \addcontentsline{toc}{chapter}{ABSTRACT}
  \null
  \begin{center}%
    \normalsize\bfseries ABSTRACT \par
    \par
  \end{center}
\vskip 2ex%
\hangindent=1.27cm
\@namabalik. \@tahun. {\bfseries\@judulEng}. Departement of Mathematics. Faculty of Science and Technology. Islamic State University of Maulana Malik Ibrahim Malang. Advisors: (I) \@pbbsatu. (II) \@pbbdua. \par
    \vskip 2ex%
    {\bfseries Keywords: }\@kking \par%
    \vskip 1em
  \par
}

\newenvironment{riwayathidup}{%----------------------------
 \newpage
 \addcontentsline{toc}{chapter}{RIWAYAT HIDUP}
 \singlespacing
 \begin{center}
    \normalsize\bfseries RIWAYAT HIDUP \end{center}
\vskip 1em
}

\newenvironment{absarab}{%----------------------------
 \newpage
 \addcontentsline{toc}{chapter}{ABSTRAK ARAB}
 \singlespacing
 \begin{center}
    \normalsize\bfseries ABSTRAK ARAB \end{center}
\vskip 1em
}

\RequirePackage[left=4cm, right=3cm,top=3cm,bottom=3cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{parskip}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{tabularx}
%%---menentukan jenis font yang digunakan--------
\RequirePackage{times}
\RequirePackage{mathrsfs}
\RequirePackage[scaled=.90]{helvet}
%%---mengatur jarak dalam list -----------
\RequirePackage{enumitem}
\setlist{labelindent=\parindent,itemsep=-2ex,%
         leftmargin=*,topsep=-1ex}
%

\newcommand{\DaftarIsi}{%---------------------
    \newpage
    \pagestyle{plain}
    \singlespacing
    \addcontentsline{toc}{chapter}{DAFTAR ISI}
    \tableofcontents
     }
    
%%%================================tambahan untuk generate list of appendices=====================%%%%
\newcommand\listofappendices{\@starttoc{loa}}
\newcommand\l@appendix{chapter}

\newcommand{\daftarlampiran}{%--------------------
    \clearpage
    \pagestyle{plain}
    \singlespacing
    \addcontentsline{toc}{chapter}{DAFTAR LAMPIRAN}
    %\vspace*{2.5em}
    \centerline{\normalsize\bfseries DAFTAR LAMPIRAN}
    \vspace{1.5cm}
    \listofappendices}
\renewcommand*\l@appendix{\@dottedtocline{1}{0.4em}{7.35em}}
%%%======================================================================================%%%%
\newcommand{\DaftarGambar}{%----------------------
    \newpage
    \singlespacing
    \addcontentsline{toc}{chapter}{DAFTAR GAMBAR}
    \listoffigures}
\renewcommand*\l@figure{\@dottedtocline{1}{1.5em}{7.35em}}

\newcommand{\DaftarTabel}{%----------------------
    \newpage
    \singlespacing
    \addcontentsline{toc}{chapter}{DAFTAR TABEL}
    \listoftables}
    
\newenvironment{Daftarsimbol}{%-------------------------
 \newpage
 \addcontentsline{toc}{chapter}{DAFTAR SIMBOL}
 \singlespacing
 \begin{center}
    \normalsize\bfseries DAFTAR SIMBOL \end{center}
\vskip 1em
}

\newcommand\MulaiSkripsi{%
    \label{halakhirR}
    \addtocontents{toc}{\protect{\vspace*{1ex}}}
    \clearpage
    \onehalfspacing
    \pagenumbering{arabic}
    \setcounter{page}{1}
}
\newenvironment{lampiran}{%-----------------------------------
 \newpage
 \addcontentsline{toc}{chapter}{LAMPIRAN}
    \begin{mtchideinmaintoc}
    \appendix
    \part{Lampiran}
    %\parttoc
    }{%
    \end{mtchideinmaintoc}
    }

\renewcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{empty}%------
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \normalsize \bfseries \MakeUppercase{#2}\par}%
    \@endpart}
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\gdef\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\@chapapp\space\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{\@chapapp\space#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\gdef\@makechapterhead#1{%
  %\vspace*{5\p@}%
  {\parindent \z@ \centering\normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \normalsize\bfseries \@chapapp\space \thechapter\\
      \fi
    \fi
    \normalsize\bfseries #1\par\nobreak
    \vskip 1em
  }}
\gdef\@schapter#1{\@makeschapterhead{#1}%
                 \@afterheading
                 }
\gdef\@makeschapterhead#1{%
  \vspace*{5\p@}%
  {\parindent \z@ \centering
    \normalfont
    \interlinepenalty\@M
    \normalsize\bfseries  #1\par\nobreak
    \vskip 40\p@
}}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1.5ex \@plus -1ex \@minus -.2ex}%
                                   {.01ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1.5ex\@plus -1ex \@minus -.2ex}%
                                     {.01ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-.25ex\@plus -1ex \@minus -.2ex}%
                                     {.01ex \@plus.2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {.25ex \@plus1ex \@minus.2ex}%
                                    {-1.5em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                    {.25ex \@plus1ex \@minus .2ex}%
                                    {0.1ex \@plus 0ex \@minus 1ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \figurename\ \@arabic\c@chapter.\fi \@arabic\c@figure}
\def\fnum@figure{\nobreakspace\thefigure}
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \tablename\ \@arabic\c@chapter.\fi \@arabic\c@table}
\def\fnum@table{\nobreakspace\thetable}

\renewcommand\@dotsep{3}
\renewcommand\tableofcontents{%
      \@restonecolfalse
    \chapter*{\contentsname
        \@mkboth{}{}}%
    \@starttoc{toc}%
    }
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 0.5em \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode %\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section{\@dottedtocline{1}{4em}{2.75em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{6.85em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{8.0em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\RequirePackage{makeidx}
\makeindex
\newcommand{\TulisIndeks}{%
    \newpage
    %\small
    \singlespacing
    \addtocontents{toc}{\protect{\vspace*{1ex}}}
    \addcontentsline{toc}{chapter}{INDEKS}
    \printindex
}

%%%------------- PENYESUAIAN ISTILAH ---------------------------
\renewcommand\contentsname{\vskip -1.2cm{DAFTAR ISI}}
\renewcommand\listfigurename{\vskip -1.2cm{DAFTAR GAMBAR}}
\renewcommand\listtablename{\vskip -1.2cm{DAFTAR TABEL}}
\renewcommand\bibname{\vskip -1.2cm{DAFTAR PUSTAKA}}
\renewcommand\indexname{INDEKS}
\renewcommand\figurename{Gambar}
\renewcommand\tablename{Tabel}
\renewcommand\chaptername{BAB}
\renewcommand\appendixname{Lampiran}
\renewcommand{\seename}{\textit{lihat:}}%-------untuk indeks
\renewcommand{\proofname}{\textit{\textbf{Bukti.}}}%---bukti teorema dlsb

%%%-----------setting perujukan dan daftar pustaka----------------
\RequirePackage[abbr]{itbbib}
\citationstyle{itbbib}
\renewcommand{\harvardand}{dan}
\newcommand\DaftarPustaka[1]{%
    \clearpage
    \singlespacing
    \setlength{\parskip}{1ex}
    \addcontentsline{toc}{chapter}{DAFTAR PUSTAKA}
    \bibliographystyle{itbbib}
    \bibliography{Dafpus}
}%%%--------------------------------------------------------------
\RequirePackage{totpages}%------hanya untuk rekap; bisa dihilangkan
\RequirePackage{datetime}
\newcommand\rekap{%
    \newpage
    \setcounter{page}{\value{page}-1}\label{halakhirA}
    \thispagestyle{empty}
    \null
    \par
    \dotfill\par
    \textbf{Info cetak .....}\par
    Revisi/cetak terakhir: \today, pukul \currenttime \par
    Nomor halaman: i--\pageref{halakhirR},\quad%
                   1--\pageref{halakhirA} \qquad
    Total: \theTotPages\ halaman\par
   \dotfill\par
}
\AtEndDocument{\rekap}%------akhir rekap----------- 

\def\today{\number\day\space\ifcase\month\or
 Januari\or Februari\or Maret\or April\or Mei\or Juni\or
 Juli\or Agustus\or September\or Oktober\or November\or Desember\fi
 \space \number\year}

    \setlength\columnsep{10\p@}
    \setlength\columnseprule{0\p@}
    \lefthyphenmin=5
    \righthyphenmin=5
    \pagestyle{plain}
    \pagenumbering{arabic}
    \belowcaptionskip=1ex
    \sloppy
    \onehalfspacing
    %\setlength{\parskip}{1em}
%
%-------menyesuaikan paragraf-----------------------------
\parskip=0.65\baselineskip \advance\parskip by 0pt plus 2pt
\parindent=\z@
   \parsep = \parskip
   %\itemsep = \z@ % add nothing to \parskip between items
   %\topsep = \z@ % add nothing to \parskip before first item

\def\@listI{\leftmargin\leftmargini
   \topsep\z@ \parsep\parskip \itemsep\z@}
\let\@listi\@listI
\@listi

\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep
   \topsep\z@ \parsep\parskip \itemsep\z@}
\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep\z@ \parsep\parskip \itemsep\z@}
\partopsep=\z@

\@ifundefined{CheckCommand}{}{%
  \CheckCommand*{\@starttoc}[1]{%
    \begingroup
      \makeatletter
      \@input{\jobname.#1}%
      \if@filesw
        \expandafter\newwrite\csname tf@#1\endcsname
        \immediate\openout \csname tf@#1\endcsname \jobname.#1\relax
      \fi
      \@nobreakfalse
    \endgroup}}

\renewcommand*{\@starttoc}[1]{%
  \begingroup
    \makeatletter
    \parskip\z@
    \@input{\jobname.#1}%
    \if@filesw
      \expandafter\newwrite\csname tf@#1\endcsname
      \immediate\openout \csname tf@#1\endcsname \jobname.#1\relax
    \fi
    \@nobreakfalse
  \endgroup
}
\endinput
%%
%% end of file `skripsi.cls'.
