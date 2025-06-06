\ProvidesClass{ustb-thesis}

\LoadClass[
  a4paper,
  twoside,
  scheme=chinese,
  zihao=-4,
  autoindent=true,
  linespread=1.41,
]{ctexrep}
\setlength{\parskip}{1.2pt plus 0pt minus 0pt}  % 确保段落间距精确为2pt

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
\usepackage{eso-pic}
\usepackage{xcolor}
\RequirePackage{caption}

\RequirePackage{xeCJK}
\RequirePackage{ifplatform}  % 用于检测操作系统平台

% 设置中文字体加粗参数
\xeCJKsetup{EmboldenFactor=3}

% 创建判断Overleaf平台的命令
\newif\ifoverleaf
\overleaffalse

% 检测是否在Overleaf上运行
\IfFileExists{/etc/overleaf/env}{
  \overleaftrue
}{}

% 根据平台选择不同的字体设置
\ifwindows
  % Windows平台字体设置
  \newcommand\ustb@set@cjk@font@windows{%
    \setCJKmainfont{SimSun}[
      AutoFakeBold = true,
      ItalicFont   = KaiTi,
    ]%
    \setCJKsansfont{SimHei}[AutoFakeBold=true]%
    \setCJKmonofont{FangSong}%
    \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=true]%
    \setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold=true]%
    \setCJKfamilyfont{zhkai}{KaiTi}[AutoFakeBold=true]%
    \setCJKfamilyfont{zhfs}{FangSong}[AutoFakeBold=true]%
  }
  \ustb@set@cjk@font@windows

  % 设置西文默认字体为Times New Roman
  \setmainfont{Times New Roman}[
    Ligatures = TeX,
  ]
\fi

% 定义带自动加粗效果的命令
\providecommand{\boldsongti}{\songti\bfseries}
\providecommand{\boldheiti}{\heiti\bfseries}
\providecommand{\boldkaiti}{\kaishu\bfseries}
\providecommand{\boldfangsong}{\fangsong\bfseries}

% 设置页边距
\geometry{
  top=1.5cm,        % 上边距3厘米
  bottom=2.5cm,     % 下边距2.5厘米
  left=3cm,       % 左边距（内边距）3厘米
  right=3cm,      % 右边距（外边距）3厘米
  bindingoffset=1cm,   % 装订线距离1厘米
  headheight=0.8cm,  % 页眉高度0.8厘米
  headsep=0.5cm,     % 页眉底端到正文顶端的距离0.5厘米
  footskip=0.8cm,    % 正文底端到页脚底端的距离
  includehead=true,  % 页眉计入页面总高度
  includefoot=true,  % 页脚计入页面总高度
}

% 设置章节标题样式
\ctexset{
  chapter = {
    name = {},
    aftername = { },
    nameformat = {},
    titleformat = {},
    number = \arabic{chapter},
    format = \heiti\zihao{-3}\bfseries,
    beforeskip = {19pt},
    afterskip = {27pt},
    fixskip = true,        % 固定间距
    break = \clearpage,
  },
  section = {
    aftername = { },
    format = \heiti\zihao{4}\bfseries,
    hang=false,
    beforeskip = {22pt},
    afterskip = {23.5pt},
    fixskip = true        % 固定间距
  },
  subsection = {
    aftername = { },
    format = \heiti\zihao{4}\bfseries,
    hang=false,
    beforeskip = {22pt},
    afterskip = {23.5pt},
    fixskip = true        % 固定间距
  },
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

\DeclareCaptionLabelSeparator{myspace}{\hspace{5pt}} %设置新间隔长度
% 设置图标题格式：五号、黑体、加粗
\DeclareCaptionFont{ustbfigfont}{\zihao{5}\boldheiti}
\captionsetup[figure]{
  font=ustbfigfont,
  labelsep=myspace,                 % 使用空格代替冒号
  aboveskip=0pt plus 0pt minus 0pt,         % 标题之前的距离
  skip=9pt plus 0pt minus 0pt,              % 标题与图片之间的距离
  belowskip=2pt plus 0pt minus 0pt          % 标题之后的距离
}

% 设置表标题格式：五号、黑体、加粗
\DeclareCaptionFont{ustbtabfont}{\zihao{5}\boldheiti}
\captionsetup[table]{
  font=ustbtabfont,
   labelsep=myspace,                 % 使用空格代替冒号
  aboveskip=0pt plus 0pt minus 0pt,          % 标题之前的距离
  skip=10pt plus 0pt minus 0pt,              % 标题与表格之间的距离
  belowskip=12pt plus 0pt minus 0pt          % 标题之前的距离
}

\AtBeginEnvironment{figure}{\vspace{-2pt}}  % 图片环境前添加额外间距
\AtEndEnvironment{table}{\vspace{-6pt}}     % 表格环境后添加额外间距

% 设置页眉页脚
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[C]{%
    \makebox[\textwidth]{%
      \begin{minipage}[t]{\textwidth}%
        \centering
        \songti\zihao{5}北京科技大学本科生毕业设计(论文)\\
        \rule[1cm]{\textwidth}{0.1pt}%
      \end{minipage}%
    }%
  }
  \fancyfoot[C]{\raisebox{1.5ex}{\zihao{5}-\ \thepage\ -}}
  \renewcommand{\headrulewidth}{0pt}
}

% 设置普通页面的页眉页脚
\pagestyle{fancy}
  \fancyhf{}
  \fancyhead[C]{%
    \makebox[\textwidth]{%
      \begin{minipage}[t]{\textwidth}%
        \centering
        \songti\zihao{5}北京科技大学本科生毕业设计(论文)\\
        \rule[1cm]{\textwidth}{0.1pt}%
      \end{minipage}%
    }%
  }
  \fancyfoot[C]{\raisebox{1.5ex}{\zihao{5}-\ \thepage\ -}}
\renewcommand{\headrulewidth}{0pt}

% 设置列表间距
\usepackage{enumitem}
\setlist{
  itemsep=0pt,      % 列表项之间的垂直间距
  parsep=0pt,       % 段落之间的垂直间距
  topsep=0pt,       % 列表与上文之间的垂直间距
  partopsep=0pt,    % 列表与上文之间的额外垂直间距（当列表出现在新段落开始时）
  leftmargin=2em,   % 列表的左边距
  rightmargin=0pt,  % 列表的右边距
  labelsep=0.5em,   % 标签与文本之间的水平间距
}

% 设置列表环境中的行间距
\AtBeginEnvironment{itemize}{\linespread{1.41}\selectfont}
\AtBeginEnvironment{enumerate}{\linespread{1.41}\selectfont}
\AtBeginEnvironment{description}{\linespread{1.41}\selectfont}
