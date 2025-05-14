\ProvidesClass{ustb-thesis}

\LoadClass[
  a4paper,
  twoside, 
  scheme=chinese,
  zihao=-4,
  autoindent=true,
  linespread=1.41,
]{ctexrep}

\usepackage{amsmath}
\usepackage{geometry}
\usepackage{graphicx}
\usepackage{titletoc}
\usepackage{pgfkeys}
\usepackage[normalem]{ulem} % 下划线包
\usepackage{xparse} % 用于更强大的命令定义
\usepackage{framed}
\usepackage{tikz}
\usetikzlibrary{calc}
\usepackage{fancyhdr} % 添加 fancyhdr 包
\usepackage{pdfpages}
\usepackage[style=gb7714-2015]{biblatex}
\usepackage{booktabs}
\usepackage{listings}

% 设置页眉页脚
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[C]{%
    \begin{minipage}{\textwidth}
      \centering
      \songti\zihao{5}北京科技大学本科生毕业设计(论文)\\
      \rule[1cm]{\textwidth}{0.1pt}
    \end{minipage}
  }
  \fancyfoot[C]{\raisebox{1.5ex}{\zihao{5}-\ \thepage\ -}}
  \renewcommand{\headrulewidth}{0pt}
}

% 设置普通页面的页眉页脚
\pagestyle{fancy}
  \fancyhf{}
  \fancyhead[C]{%
    \begin{minipage}{\textwidth}
      \centering
      \songti\zihao{5}北京科技大学本科生毕业设计(论文)\\
      \rule[1cm]{\textwidth}{0.1pt}
    \end{minipage}
  }
  \fancyfoot[C]{\raisebox{1.5ex}{\zihao{5}-\ \thepage\ -}}
\renewcommand{\headrulewidth}{0pt}

% 设置章节标题样式
\ctexset{
  chapter = {
    name = {},
    number = \arabic{chapter},
    format = \heiti\zihao{-3}\bfseries,
    beforeskip = {0pt},
    afterskip = {17pt},
    break = \clearpage,
  },
  section = {
    format = \heiti\zihao{4}\bfseries,
    hang=false,
    beforeskip = {13pt},
    afterskip = {13pt}
  },
  subsection = {
    format = \heiti\zihao{4}\bfseries,
    hang=false,
    beforeskip = {13pt},
    afterskip = {13pt}
  },
}

% 设置页边距
\geometry{
  top=3cm,        % 上边距3厘米
  bottom=2.5cm,     % 下边距2.5厘米（按照官方模板应当是2cm，但实际使用中发现2cm会导致页码显示不全，因此改为2.5cm）
  left=3cm,       % 左边距（内边距）3厘米
  right=3cm,      % 右边距（外边距）3厘米
  bindingoffset=1cm  % 装订线距离1厘米
}

% 设置目录页格式
\renewcommand{\contentsname}{\centering 目\hspace{1em}录\par}

\titlecontents{chapter}[0pt]
  {\songti\zihao{-4}}
  {\contentslabel{0pt}\hspace{1em}}
  {}
  {\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{section}[2em]
  {\songti\zihao{-4}}
  {\contentslabel{0pt}\hspace{1.75em}}
  {}
  {\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{subsection}[4em]
  {\songti\zihao{-4}}
  {\contentslabel{0pt}\hspace{2.5em}}
  {}
  {\titlerule*[0.5pc]{.}\contentspage}

% 重定义 cleardoublepage 命令，确保奇数页不显示页码
\renewcommand{\cleardoublepage}{%
  \clearpage
  \if@twoside
    \ifodd\c@page
    \else
      \thispagestyle{empty} % 强制当前页不显示页码（empty 样式）
      \hbox{} % 空内容
      \newpage
    \fi
  \fi
}

% 设置参考文献样式
\addbibresource{refs.bib}
\defbibheading{bibliography}[\refname]{%
  \begin{center}
    \heiti\zihao{-3}参考文献
  \end{center}
}

% 代码样式
\lstset{
    basicstyle=\ttfamily\small,
    commentstyle=\color{gray},
    breaklines=true,
    frame=single, % 添加边框
    numbers=left, % 行号
}

% 修改图片编号格式
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

% 修改表格编号格式
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}

% 修改公式编号格式
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

% 修改引用格式，自动添加"图"和"表"字
\newcommand{\figref}[1]{图\ref{#1}}
\newcommand{\tabref}[1]{表\ref{#1}}

% 设置行间公式和多行公式的编号
\everymath{\displaystyle}
% \setlength{\mathindent}{0pt}
% \allowdisplaybreaks[4]

% 设置多行公式的编号
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
