\ProvidesClass{ustb-thesis}

\LoadClass[
  a4paper,
  twoside, 
  scheme=chinese,
  zihao=-4,
  autoindent=true,
  linespread=1.41,
]{ctexrep}

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
  \fancyfoot[C]{-\ \thepage\ -}
  \renewcommand{\headrulewidth}{0pt}
}

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
  bottom=2cm,     % 下边距2厘米
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
  {\hfill\contentspage}
\titlecontents{section}[2em]
  {\songti\zihao{-4}}
  {\contentslabel{0pt}\hspace{1.75em}}
  {}
  {\hfill\contentspage}
\titlecontents{subsection}[4em]
  {\songti\zihao{-4}}
  {\contentslabel{0pt}\hspace{2.5em}}
  {}
  {\hfill\contentspage}

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