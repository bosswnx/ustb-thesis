\ProvidesClass{ustb-thesis}

\LoadClass[
  twoside, 
  scheme=chinese,
  zihao=-4,
  autoindent=true,
  linespread=1.41,
]{ctexrep}

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
