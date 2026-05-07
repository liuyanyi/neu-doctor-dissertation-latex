%%
%% This is file `neudissertation.cls'.
%%
%% Copyright (C) 2020 by Chaopeng GUO <guochaopeng@swc.neu.edu.cn>
%%
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%%
%% http://www.latex-project.org/lppl.txt
%%
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%%
%% Any Suggestions : Chaopeng Guo <guochaopeng@swc.neu.edu.cn>
%%
\NeedsTeXFormat{LaTeX2e}[2023/11/01]
\ProvidesClass{neudissertation}[2026/01/01 v1.0 Northeastern University Dissertation Template]
\RequirePackage{etoolbox}
\RequirePackage{expl3}
\RequirePackage { l3keys2e }
\ExplSyntaxOn
\tl_new:N \g_neudissertation_type_tl
\keys_define:nn { neudissertation }
{
  % 定义 Type 键
  Type .choices:nn =
  {Bachelor, Master, Doctor}
  {
    %      \iow_term:e { [DEBUG]~Matched~Choice:~ \l_keys_choice_tl }
    \tl_gset:NV \g_neudissertation_type_tl \l_keys_choice_tl
  },
  Type / unknown .code:n =
  {
    \ClassError{neudissertation}{Unknown~Type:~'#1'}{
      Valid~options~are:~Bachelor,~Master,~Doctor.\MessageBreak
      The~default~'Bachelor'~will~be~used.
    }
    \tl_gset:Nn \g_neudissertation_type_tl {Bachelor}
  },
  unknown .code:n = { \PassOptionsToClass { \CurrentOption } { ctexbook } }
}
% 处理参数
\ProcessKeysOptions{neudissertation}
\ExplSyntaxOff

\LoadClass[a4paper,zihao=-4,openright,oneside]{ctexbook}

% 使用示例：
\RequirePackage{ifthen}
\RequirePackage[includeheadfoot]{geometry}
\RequirePackage{geometry}
\geometry{a4paper,left=2.5cm, right=2.5cm, top=1.5cm, bottom=2cm}
\geometry{headsep=0.5cm,footskip=1cm}

% Font Style Settings
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
\setCJKmainfont[BoldFont=华文中宋,ItalicFont=楷体]{宋体}
\setCJKsansfont{黑体} % Hei
\setCJKmonofont{仿宋} % Fangsong
\setCJKfamilyfont{song}{宋体}
\setCJKfamilyfont{hei}{黑体}
\setCJKfamilyfont{fs}{仿宋} % fang-song
\setCJKfamilyfont{kai}{楷体} % Kai
\newcommand{\cusong}{\bfseries}
\newcommand{\song}{\CJKfamily{song}} % 宋体
\newcommand{\fs}{\CJKfamily{fs}}
\newcommand{\kai}{\CJKfamily{kai}}
\newcommand{\hei}{\CJKfamily{hei}}
%% Font Size Settings
\newcommand{\chuhao}{\zihao{0}}
\newcommand{\xiaochu}{\zihao{-0}}
\newcommand{\yihao}{\zihao{1}}
\newcommand{\xiaoyi}{\zihao{-1}}
\newcommand{\erhao}{\zihao{2}}
\newcommand{\xiaoer}{\zihao{-2}}
\newcommand{\sanhao}{\zihao{3}}
\newcommand{\xiaosan}{\zihao{-3}}
\newcommand{\sihao}{\zihao{4}}
\newcommand{\xiaosi}{\zihao{-4}}
\newcommand{\wuhao}{\zihao{5}}
\newcommand{\xiaowu}{\zihao{-5}}
\newcommand{\liuhao}{\zihao{6}}
\newcommand{\xiaoliu}{\zihao{-6}}
\newcommand{\qihao}{\zihao{7}}
\newcommand{\bahao}{\zihao{8}}

% Define Variables
\def\@empty{}
\newcommand\studentid[1]{\renewcommand\@studentid{#1}}
\newcommand\@studentid{}

\newcommand\zhsupervisor[1]{\renewcommand\@zhsupervisor{#1}}
\newcommand\@zhsupervisor{}
\newcommand\zhsupervisortitle[1]{\renewcommand\@zhsupervisortitle{#1}}
\newcommand\@zhsupervisortitle{}
\newcommand\zhsupervisorwork[1]{\renewcommand\@zhsupervisorwork{#1}}
\newcommand\@zhsupervisorwork{}
\newcommand\ensupervisor[1]{\renewcommand\@ensupervisor{#1}}
\newcommand\@ensupervisor{}

\newcommand\zhsupervisortwo[1]{\renewcommand\@zhsupervisortwo{#1}}
\newcommand\@zhsupervisortwo{}
\newcommand\zhsupervisortwotitle[1]{\renewcommand\@zhsupervisortwotitle{#1}}
\newcommand\@zhsupervisortwotitle{}
\newcommand\zhsupervisortwowork[1]{\renewcommand\@zhsupervisortwowork{#1}}
\newcommand\@zhsupervisortwowork{}
\newcommand\ensupervisortwo[1]{\renewcommand\@ensupervisortwo{#1}}
\newcommand\@ensupervisortwo{}

\newcommand\campusname[1]{\renewcommand\@campusname{#1}}
\newcommand\@campusname{}
\newcommand\encampusname[1]{\renewcommand\@encampusname{#1}}
\newcommand\@encampusname{}

\newcommand\classification[1]{\renewcommand\@classification{#1}}
\newcommand\@classification{}
\newcommand\serialno[1]{\renewcommand\@serialno{#1}}
\newcommand\@serialno{}
\newcommand\udc[1]{\renewcommand\@udc{#1}}
\newcommand\@udc{}
\newcommand\zhtitle[1]{\renewcommand\@zhtitle{#1}}
\newcommand\@zhtitle{}
\newcommand\entitle[1]{\renewcommand\@entitle{#1}}
\newcommand\@entitle{}
\newcommand\zhauthor[1]{\renewcommand\@zhauthor{#1}}
\newcommand\@zhauthor{}
\newcommand\enauthor[1]{\renewcommand\@enauthor{#1}}
\newcommand\@enauthor{}
\newcommand\zhdegreetype[1]{\renewcommand\@zhdegreetype{#1}}
\newcommand\@zhdegreetype{}
\newcommand\zhmajortype[1]{\renewcommand\@zhmajortype{#1}}
\newcommand\@zhmajortype{}
\newcommand\zhmajor[1]{\renewcommand\@zhmajor{#1}}
\newcommand\@zhmajor{}
\newcommand\enmajor[1]{\renewcommand\@enmajor{#1}}
\newcommand\@enmajor{}
\newcommand\zhsubmissiondate[1]{\renewcommand\@zhsubmissiondate{#1}}
\newcommand\@zhsubmissiondate{}
\newcommand\zhdefensedate[1]{\renewcommand\@zhdefensedate{#1}}
\newcommand\@zhdefensedate{}
\newcommand\zhdegreegivendate[1]{\renewcommand\@zhdegreegivendate{#1}}
\newcommand\@zhdegreegivendate{}
\newcommand\zhdefensechairmen[1]{\renewcommand\@zhdefensechairmen{#1}}
\newcommand\@zhdefensechairmen{}
\newcommand\zhreviewers[1]{\renewcommand\@zhreviewers{#1}}
\newcommand\@zhreviewers{}
\newcommand\zhthesisdate[1]{\renewcommand\@zhthesisdate{#1}}
\newcommand\@zhthesisdate{}
\newcommand\enthesisdate[1]{\renewcommand\@enthesisdate{#1}}
\newcommand\@enthesisdate{}

% Document Organization Settings
\RequirePackage[center]{titlesec}

\linespread{1.55}
%% Document Structure Settings: Headers and Footers
\RequirePackage{fancyhdr}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\fancypagestyle{plain}{}

% for declaration page
\fancypagestyle{frontmatternohead}{%
  \fancyhf{}
  \fancyfoot[C]{\xiaowu \thepage}
  \setlength{\parskip}{0pt}
\renewcommand{\headrulewidth}{0pt}}

\ExplSyntaxOn
\tl_new:N \neu@LeftTitle
\tl_new:N \neu@headrule

\str_case:VnF \g_neudissertation_type_tl
{
  {Bachelor}
  {
    \tl_gset:Nn \neu@LeftTitle {东北大学本科学位论文}
    \tl_gset:Nn \neu@headrule {
      \hrule width\headwidth height0.5pt \vskip 1pt
    }
  }
  {Master}
  {
    \tl_gset:Nn \neu@LeftTitle {东北大学硕士学位论文}
    \tl_gset:Nn \neu@headrule {
      \hrule width\headwidth height0.5pt \vskip 1pt
    }
  }
  {Doctor}
  {
    \tl_gset:Nn \neu@LeftTitle {东北大学博士学位论文}
    \tl_gset:Nn \neu@headrule {
      \hrule width\headwidth height1pt \vskip 1pt
      \hrule width\headwidth height0.5pt \vskip 0pt
    }
  }
}
{
  \tl_gset:Nn \neu@LeftTitle {未知文档类型}
}
\ExplSyntaxOff

\fancypagestyle{zhabstract}{%
  \fancyhead[L] {%
    \xiaowu \kai
    \neu@LeftTitle
  }
  \fancyhead[R] {\xiaowu \kai 摘\quad 要}
  \fancyfoot[C]{\xiaowu \thepage}
  \titleformat{\chapter}{\vspace{-1cm}\center \erhao \hei}{~}{0em}{{\vspace{-0.5cm}\hei\sanhao \@zhtitle }\vspace{0.5cm} \\ }
  \titlespacing{\chapter}{0pt}{*1}{0.7cm}
  \linespread{1.625}
  \setlength{\parskip}{0pt}
  \xiaosi
\renewcommand{\headrule}{\neu@headrule}}

\fancypagestyle{enabstract}{%
  \fancyhead[L] {\xiaowu \kai \neu@LeftTitle}
  \fancyhead[R] {\xiaowu \kai Abstract }
  \fancyfoot[C]{\xiaowu \thepage}
  \titleformat{\chapter}{\vspace{-1.5cm}\center \erhao \hei}{~}{1em}{{\sanhao \@entitle }\\ }
  \titlespacing{\chapter}{0pt}{*1}{0.7cm}
  \linespread{1.4375}
  \setlength{\parskip}{0pt}
  \xiaosi
\renewcommand{\headrule}{\neu@headrule}}

\fancypagestyle{tableofcontents}{%
  \fancyhead[L] {\xiaowu \kai \neu@LeftTitle}
  \fancyhead[R] {\xiaowu \kai 目\quad 录}
  \fancyfoot[C]{\xiaowu \thepage}
  \titleformat{\chapter}[hang]{\vspace{-1cm}\center \erhao \hei}{~}{1em}{}
  \titlespacing{\chapter}{0pt}{*1}{0.7cm}
  \xiaosi
  \linespread{1.625}
  \setlength{\parskip}{0pt}
\renewcommand{\headrule}{\neu@headrule}}

\fancypagestyle{mainbody}{%
  \fancyhead[L] {\xiaowu \kai \neu@LeftTitle}
  \fancyhead[R] {\xiaowu \kai 第\thechapter 章\ \leftmark}
  \fancyfoot[C]{\xiaowu -\thepage-}
  \linespread{1.625}
  \setlength{\parskip}{0pt}
  \titleformat{\chapter}[hang]{\vspace{-1cm}\center \erhao \hei}{第\thechapter 章}{1em}{\hei}
  \titlespacing{\chapter}{0pt}{*1}{0.7cm}
  \titleformat{\section}{\sanhao \hei}{\thesection}{0.5em}{}
  \titlespacing{\section}{0pt}{*1.5}{*1.5}
  \titleformat{\subsection}{\sihao \hei}{\thesubsection}{0.5em}{}
  \titlespacing{\subsection}{0pt}{*0}{*1}
  \xiaosi
  \renewcommand{\headrule}{\neu@headrule}%
}

\fancypagestyle{backmatternochapter}{%
  \fancyhead[L] {\xiaowu \kai \neu@LeftTitle}
  \fancyhead[R] {\xiaowu \kai \leftmark }
  \linespread{1.625}
  \setlength{\parskip}{0pt}
  \titleformat{\chapter}[hang]{\vspace{-1cm}\center \erhao \hei}{~}{1em}{}
  \titlespacing{\chapter}{0pt}{*1}{0.7cm}
  \xiaosi

\fancyfoot[C]{\xiaowu -\thepage-}}

\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
\pagestyle{frontmatternohead}}

\newcommand\zhabstractmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
\pagestyle{zhabstract}}

\newcommand\enabstractmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
\pagestyle{enabstract}}

\newcommand\tableofcontentsmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
\pagestyle{tableofcontents}}

\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
\pagestyle{mainbody}}

\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
\pagestyle{backmatternochapter}}

\newcommand\lastmatter{%
  \if@openright\clearpage\else\cleardoublepage\fi
  \@mainmatterfalse
\pagestyle{empty}}

%% Setting for the empty page after the chapters with odd end
\renewcommand\cleardoublepage{\clearpage\if@openright \ifodd\c@page\else
  \newpage{}
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
  \end{center}
  \vspace*{\fill}
\clearpage\fi\fi}

\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[Symbolsmallscale]{upgreek}
\interdisplaylinepenalty=2500
\RequirePackage{bm}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{zhnumber}
\RequirePackage{indentfirst}
\RequirePackage{xunicode-addon}
\RequirePackage{cite}
\RequirePackage{multicol}
\RequirePackage{makecell}
\newcommand{\entry}[3]{\multicolumn{#1}{l}{\underline{\hbox to #2{\hfil#3\hfil}}}}

% Define Contents of Table
\RequirePackage{titletoc}
\CTEXsetup[name={,}, number=\arabic{chapter}]{chapter}

\titlecontents{chapter}[0cm]{\bf}{\hei 第 \contentslabel{0cm} \hspace*{0.1cm} 章 \hspace*{0.2cm} }%
{}{\titlerule*[0.4pc]{$\cdot$}\contentspage}%

\titlecontents{section}[2cm]{\bf}%
{\contentslabel{2.5em}}%
{}%
{\titlerule*[0.4pc]{$\cdots$}\contentspage}

\titlecontents{subsection}[3cm]{}%
{\contentslabel{2.5em}}%
{}%
{\titlerule*[0.4pc]{$\cdots$}\contentspage}

\newcommand{\neu@bachelor@maketitle}{
  \newpage
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \node at (current page.center) {
      \includegraphics[width=21cm, height=29.7cm]{Figures/neucover}
    };
  \end{tikzpicture}

  \vspace{13.5cm}
  \hspace{0.9cm}
  \begin{tabular}{lp{10cm}}
    \makebox[3.5cm][s]{\xiaosan 论文题目:} & \xiaosan \@zhtitle      \\[3mm]
    \makebox[3.5cm][s]{\xiaosan 学院名称:} & \xiaosan \@campusname   \\[3mm]
    \makebox[3.5cm][s]{\xiaosan 专业名称:} & \xiaosan \@zhmajor      \\[3mm]
    \makebox[3.5cm][s]{\xiaosan 学生姓名:} & \xiaosan \@zhauthor     \\[3mm]
    \makebox[3.5cm][s]{\xiaosan 指导老师:} & \xiaosan \@zhsupervisor
    \ifx\@zhsupervisortwo\@empty
    \else
    \quad \@zhsupervisortwo
    \fi                                                          \\
  \end{tabular}

  \newpage
  \thispagestyle{empty}

  ~

  \newpage
  \thispagestyle{empty}
  \vspace{5mm}
  \begin{center}
    \hei \wuhao %
    \begin{tabular}{llcll}
      \wuhao 学号 & \entry{1}{5cm}{\@studentid} & \hspace*{1cm} %
      \wuhao 密级 & \entry{1}{5cm}{\@serialno}                  \\    %
    \end{tabular}
  \end{center}%

  \vspace{18mm}
  \begin{center}
    \song \yihao 东北大学本科毕业论文
  \end{center}

  \vspace{24mm}
  \begin{center}
    \hei \erhao \@zhtitle
  \end{center}

  \vspace{29mm}
  \begin{center}
    \begin{tabular}{ll}
      \makebox[3.5cm][s]{\xiaosan 学院名称:} & \xiaosan \@campusname                                 \\[3mm]
      \makebox[3.5cm][s]{\xiaosan 专业名称:} & \xiaosan \@zhmajor                                    \\[3mm]
      \makebox[3.5cm][s]{\xiaosan 作者姓名:} & \xiaosan \@zhauthor                                   \\[3mm]
      \makebox[3.5cm][s]{\xiaosan 指导老师:} & \xiaosan \@zhsupervisor\quad \@zhsupervisortitle      \\[3mm]
      \ifcsvoid{@zhsupervisortwo}{}{
        & \xiaosan \@zhsupervisortwo\quad\@zhsupervisortwotitle \\[3mm]
      }
    \end{tabular}
  \end{center}

  \vspace{24mm}
  \begin{center}
    \xiaoer \@zhthesisdate
  \end{center}

  \newpage
  \thispagestyle{empty}
  ~

  \newpage
  \thispagestyle{empty}

  \vspace*{20mm}
  \begin{center}
    \hei \erhao \@zhtitle
  \end{center}

  \vspace{60mm}
  \begin{center}
    \begin{tabular}{p{3.5cm}l}
      \xiaosan 作者姓名:   & \xiaosan \@zhauthor        \\
      \xiaosan 校内指导老师: & \xiaosan \@zhsupervisor    \\
      \ifcsvoid{@zhsupervisortwo}{}{
        \xiaosan 校外指导老师: & \xiaosan \@zhsupervisortwo \\
      }
      \xiaosan 单位名称:   & \xiaosan \@campusname      \\
      \xiaosan 专业名称:   & \xiaosan \@zhmajor         \\
    \end{tabular}
  \end{center}

  \vspace{45mm}
  \begin{center}
    {\sihao \song 东\ 北\ 大\ 学}

    {\sihao \song \@zhthesisdate}
  \end{center}

  \newpage
  \thispagestyle{empty}
  ~

  \newpage
  \thispagestyle{empty}

  \vspace*{20mm}
  \begin{center}
    % \begin{spacing}{1.2}%%行间距变为double-space
    %
    %\end{spacing}
    \erhao\textbf{\@entitle}
  \end{center}

  \vspace{35mm}
  \begin{center}
    \sihao
    By \@enauthor
  \end{center}

  \vspace{35mm}
  \begin{center}
    \sihao
    \begin{tabular}{p{5.5cm}l}
      \sihao
      Supervisor:           & \sihao \@ensupervisor    \\[2mm]
      \ifcsvoid{@ensupervisortwo}{}{
        \sihao Associate Supervisor: & \sihao \@ensupervisortwo \\
      }
    \end{tabular}
  \end{center}

  \vspace{35mm}
  \begin{center}
    {\sihao \centering Northeastern University}

    {\sihao \centering \@enthesisdate}
  \end{center}

  \newpage
  \thispagestyle{empty}
  ~

  \newpage
}

\newcommand{\neu@master@maketitle}{
  \thispagestyle{empty}

  \vspace*{0.15cm}
  \begin{center}
    \hei \sihao
    \begin{tabular}{llcll}
      \sihao \bf 分类号      & \entry{1}{5cm}{\@classification} & \hspace*{1cm}   %
      \sihao \bf 密级       & \entry{1}{5cm}{\@serialno}                         \\    %
      \sihao \bf UDC\quad & \entry{1}{5cm}{\@udc}            & \hspace*{1cm} &
    \end{tabular}
  \end{center}

  \vspace{45pt}
  \begin{center}
    \vspace{20pt}
    {\hei  \erhao 学\ 位\ 论\ 文}

    \vspace{35pt}
    {\hei \xiaoer \@zhtitle}
  \end{center}

  \vspace{5pt}
  \begin{center}
    \sihao
    \begin{tabular}{lllll}
      \makebox[3.5cm][s]{\sihao 作者姓名:}   & \sihao \@zhauthor                         &  &                                     &                            \\[2mm]

      \ifcsvoid{@zhsupervisortwo}{
        \makebox[3.5cm][s]{\sihao 指导教师:}   & \multicolumn{4}{l}{\sihao \@zhsupervisor \quad \@zhsupervisortitle \qquad  \@zhsupervisorwork}                                                                                        \\[2mm]
      }
      {
        \makecell[l]{\makebox[3.5cm][s]{\sihao 指导教师:} \\ ~}   & \multicolumn{4}{l}{\makecell[l]{\sihao \@zhsupervisor \quad \@zhsupervisortitle \qquad  \@zhsupervisorwork                                                                       \\ \sihao \@zhsupervisortwo \quad \@zhsupervisortwotitle \qquad \@zhsupervisortwowork}} \\[2mm]
      }
      \makebox[3.5cm][s]{\sihao 申请学位级别:} & \sihao \@zhdegreetype                     &  & \makebox[3.5cm][s]{\sihao 学科类别:}    & \sihao \@zhmajortype       \\[2mm]
      \makebox[3.5cm][s]{\sihao 学科专业名称:} & \multicolumn{4}{l}{\sihao \@zhmajor   }                                                                         \\[2mm]
      \makebox[3.5cm][s]{\sihao 论文提交日期:} & \sihao \@zhsubmissiondate                 &  & \makebox[3.5cm][s]{\sihao 论文答辩日期:}  & \sihao \@zhdefensedate     \\[2mm]
      \makebox[3.5cm][s]{\sihao 学位授予日期:} & \sihao \@zhdegreegivendate                &  & \makebox[3.5cm][s]{\sihao 答辩委员会主席:} & \sihao \@zhdefensechairmen \\[2mm]
      \makebox[3.5cm][s]{\sihao 评阅人:}    & \multicolumn{4}{l}{\sihao \@zhreviewers }
    \end{tabular}
  \end{center}

  \vspace{50pt}
  \begin{center}
    \sihao
    东\quad 北\quad 大\quad 学
  \end{center}

  \vspace{15pt}
  \begin{center}
    \sihao \@zhthesisdate
  \end{center}

  \newpage
  \thispagestyle{empty}
  ~

  \newpage
  \thispagestyle{empty}

  \vspace{20pt}
  \textbf{A Thesis in \@enmajor}

  \vspace{100pt}
  \begin{center}
    {\erhao \textbf{\@entitle}}
  \end{center}

  \vspace{40pt}
  \begin{center}
    \sihao
    By \@enauthor
  \end{center}

  \vspace{70pt}
  \begin{center}
    \sihao \@ensupervisor

    \ifcsvoid{@zhsupervisortwo}{}{
      \sihao \@ensupervisortwo
    }
  \end{center}

  \vspace{200pt}
  \begin{center}
    {\sanhao \centering \textbf{Northeastern University}}

    {\sanhao \centering  \textbf{\@enthesisdate}}
  \end{center}

  \newpage
  \thispagestyle{empty}
  ~

  \newpage
}

\newcommand{\neu@doctor@maketitle}{
  \thispagestyle{empty}

  \vspace*{0.15cm}
  \begin{center}
    \hei \sihao
    \begin{tabular}{llcll}
      \sihao \bf 分类号      & \entry{1}{5cm}{\@classification} & \hspace*{1cm}   %
      \sihao \bf 密级       & \entry{1}{5cm}{\@serialno}                         \\    %
      \sihao \bf UDC\quad & \entry{1}{5cm}{\@udc}            & \hspace*{1cm} &
    \end{tabular}
  \end{center}

  \vspace{45pt}
  \begin{center}
    \vspace{20pt}
    {\hei  \erhao 学\ 位\ 论\ 文}

    \vspace{35pt}
    {\hei \xiaoer \@zhtitle}
  \end{center}

  \vspace{5pt}
  \begin{center}
    \sihao
    \begin{tabular}{lllll}
      \makebox[3.5cm][s]{\sihao 作者姓名:}   & \sihao \@zhauthor                         &  &                                     &                            \\[2mm]

      \ifcsvoid{@zhsupervisortwo}{
        \makebox[3.5cm][s]{\sihao 指导教师:}   & \multicolumn{4}{l}{\sihao \@zhsupervisor \quad \@zhsupervisortitle \qquad  \@zhsupervisorwork}                                                                                        \\[2mm]
      }
      {
        \makecell[l]{\makebox[3.5cm][s]{\sihao 指导教师:} \\ ~}   & \multicolumn{4}{l}{\makecell[l]{\sihao \@zhsupervisor \quad \@zhsupervisortitle \qquad  \@zhsupervisorwork                                                                       \\ \sihao \@zhsupervisortwo \quad \@zhsupervisortwotitle \qquad \@zhsupervisortwowork}} \\[2mm]
      }
      \makebox[3.5cm][s]{\sihao 申请学位级别:} & \sihao \@zhdegreetype                     &  & \makebox[3.5cm][s]{\sihao 学科类别:}    & \sihao \@zhmajortype       \\[2mm]
      \makebox[3.5cm][s]{\sihao 学科专业名称:} & \multicolumn{4}{l}{\sihao \@zhmajor   }                                                                         \\[2mm]
      \makebox[3.5cm][s]{\sihao 论文提交日期:} & \sihao \@zhsubmissiondate                 &  & \makebox[3.5cm][s]{\sihao 论文答辩日期:}  & \sihao \@zhdefensedate     \\[2mm]
      \makebox[3.5cm][s]{\sihao 学位授予日期:} & \sihao \@zhdegreegivendate                &  & \makebox[3.5cm][s]{\sihao 答辩委员会主席:} & \sihao \@zhdefensechairmen \\[2mm]
      %      \makebox[3.5cm][s]{\sihao 评阅人:}    & \multicolumn{4}{l}{\sihao \@zhreviewers }
    \end{tabular}
  \end{center}

  \vspace{50pt}
  \begin{center}
    \sihao
    东\quad 北\quad 大\quad 学
  \end{center}

  \vspace{15pt}
  \begin{center}
    \sihao \@zhthesisdate
  \end{center}

  \newpage
  \thispagestyle{empty}
  ~

  \newpage
  \thispagestyle{empty}

  \vspace{20pt}
  \textbf{A Dissertation in \@enmajor}

  \vspace{100pt}
  \begin{center}
    {\erhao \textbf{\@entitle}}
  \end{center}

  \vspace{40pt}
  \begin{center}
    \sihao
    By \@enauthor
  \end{center}

  \vspace{70pt}
  \begin{center}
    \sihao \@ensupervisor

    \ifcsvoid{@zhsupervisortwo}{}{
      \sihao \@ensupervisortwo
    }
  \end{center}

  \vspace{200pt}
  \begin{center}
    {\sanhao \centering \textbf{Northeastern University}}

    {\sanhao \centering  \textbf{\@enthesisdate}}
  \end{center}

  \newpage
  \thispagestyle{empty}
  ~

  \newpage
}

\ExplSyntaxOn
\str_case:Vn \g_neudissertation_type_tl
{
  {Bachelor} {
    \let\maketitle\neu@bachelor@maketitle
  }
  {Master} {
    \let\maketitle\neu@master@maketitle
  }
  {Doctor} {
    \let\maketitle\neu@doctor@maketitle
  }
  { default } {
    \let\maketitle\neu@bachelor@maketitle
  }
}

\ExplSyntaxOff

\newcommand{\china}{中华人民共和国}
\newcommand{\pozhehao}{\kern0.2em\rule[0.8ex]{1.6em}{0.1ex}\kern0.2em}
\newcommand{\xiaopozhe}{\kern0.2em\rule[0.8ex]{0.6em}{0.1ex}\kern0.2em}
\renewcommand\contentsname{目\hspace{1em}录}
\newcommand\equationname{公式}
\renewcommand\bibname{参考文献}
\renewcommand\indexname{索引}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\renewcommand\appendixname{附录}
\newcommand{\figref}[1]{图\ref{#1}}
\newcommand{\tabref}[1]{表\ref{#1}}
\newcommand{\equref}[1]{式\ref{#1}}

\AtBeginEnvironment{table}{\wuhao}
\AtBeginEnvironment{tabular}{\wuhao}
\AtBeginEnvironment{figure}{\linespread{1}}
\RequirePackage{caption}
\renewcommand{\captionfont}{\wuhao }

\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\newcommand{\twofigcaption}[3]{\caption{#2}\label{#1}\vspace{-0.4cm}\caption*{Figure~\ref{#1}:~#3}}
\newcommand{\twotabcaption}[3]{{\linespread{1}\caption{#2}\label{#1}\vspace{-0.3cm}\caption*{Table~\ref{#1}:~#3}\vspace{-0.3cm}}}

\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setlist[enumerate]{leftmargin=\parindent}
\setlist[itemize]{leftmargin=\parindent}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[numbers, sort&compress, square]{natbib}

\ExplSyntaxOn
\tl_if_eq:NnTF \g_neudissertation_type_tl {Bachelor}
{
  \AtEndDocument{
    \lastmatter
    \begin{tikzpicture}[remember~picture, overlay]
      \node ~ at ~ (current ~ page.center) {
        \includegraphics[width=21cm, height=29.7cm]{Figures/neubackcover}
      };
    \end{tikzpicture}
  }
}{}

\ExplSyntaxOff

\endinput
