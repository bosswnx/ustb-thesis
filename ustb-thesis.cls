\ProvidesClass{ustb-thesis}

\LoadClass[
  twoside, 
  scheme=chinese,
  zihao=-4,
  autoindent=true,
  linespread=1.41,
]{ctexrep}

\usepackage{geometry}
\usepackage{graphicx}

% 设置章节标题样式
\ctexset{
  part = {
    name = {},
    break = \cleardoublepage,
  },
  chapter = {
    name = {},
    number = \arabic{chapter},
    format = \heiti\zihao{-3}\bfseries,
    beforeskip = {17pt},
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