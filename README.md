# 自用东北大学毕业论文模板

本章节旨在详细说明东北大学学位论文 LaTeX 模板的使用方法。本模板基于 `neudissertation.cls` 构建，预置了符合学校规范的字体、字号、行距及图表样式 。

## 1.1 文档设置与学位适配

本模板支持学士 (Bachelor)、硕士 (Master) 和博士 (Doctor) 三种学位论文的排版。根据学位类型的不同，需要在文档类参数、个人信息变量以及文末章节进行相应的调整 。

### 1.1.1 文档类型参数 (Type)

在 `main.tex` 的第一行，通过 `Type` 参数指定学位类型。该参数决定了封面样式、页眉页脚格式以及必要的元数据字段 。

```latex
% 本科论文
\documentclass[Type=Bachelor]{neudissertation}

% 硕士论文
\documentclass[Type=Master]{neudissertation}

% 博士论文
\documentclass[Type=Doctor]{neudissertation}

```

### 1.1.2 必要变量设置

所有学位类型的通用信息（如标题、作者、导师、学院等）在 `main.tex` 的“基础信息”和“导师”部分设置 。

**表 1.1：基础信息变量表**

| 类别 | 变量命令 | 说明 |
| --- | --- | --- |
| **标题** | `\zhtitle{...}` | 中文论文题目 |
|  | `\entitle{...}` | 英文论文题目 |
| **作者** | `\zhauthor{...}` | 作者中文姓名 |
|  | `\enauthor{...}` | 作者英文姓名（拼音） |
| **学籍** | `\studentid{...}` | 学号 |
|  | `\campusname{...}` | 学院名称（如：软件学院） |
|  | `\zhmajor{...}` / `\enmajor{...}` | 专业名称（中/英） |
| **时间** | `\zhthesisdate{...}` | 封面日期（如：202x年6月） |

**导师设置说明**

模板支持单导师和双导师模式。英文导师姓名通常需要包含职称（如 Professor X）。

**第一导师（必须设置）**

```latex
\zhsupervisor{李四}             % 中文姓名
\zhsupervisortitle{教授}        % 职称
\zhsupervisorwork{东北大学软件学院} % 工作单位
\ensupervisor{Professor Li Si}  % 英文姓名（含职称）

```

**第二导师（可选设置）**

**无第二导师时**：必须在 `main.tex` 中**注释掉或删除**下列四行代码！否则封面上会出现多余的空白或标点符号 。

* **有第二导师时**：取消注释并填写。

```latex
% \zhsupervisortwo{张三}
% \zhsupervisortwotitle{副教授}
% \zhsupervisortwowork{东北大学计算机学院}
% \ensupervisortwo{Associate Prof. Zhang San}

```

**硕博学位论文专属变量**

对于硕士和博士学位论文，必须补充填写以下信息，否则封面和题名页相关字段将为空白 ：

| 变量命令 | 含义 | 示例 |
| --- | --- | --- |
| `\zhdegreetype` | 学位类别 | 硕士/博士 |
| `\zhmajortype` | 学科门类 | 工学/理学 |
| `\zhsubmissiondate` | 论文提交日期 | 20xx年6月 |
| `\zhdefensedate` | 论文答辩日期 | 20xx年6月 |
| `\zhdegreegivendate` | 学位授予日期 | 20xx年6月 |
| `\zhdefensechairmen` | 答辩委员会主席 | 某某教授 |
| `\zhreviewers` | 评阅人 | 评阅人1 评阅人2 |

注：封面左上角的分类号 (`\classification`)、密级 (`\serialno`)、UDC (`\udc`) 一般留空即可 。

### 1.1.3 硕博补充章节：科研及发表论文

根据学校要求，硕士和博士论文需要在参考文献之后、致谢之前，增加“攻读学位期间科研及发表论文情况”章节 。请在 `main.tex` 的 文档末尾 区域取消相关代码的注释。本科毕业设计不需要此章节 。

```latex
% 仅硕博需要此章节
\chapter{攻读学位期间科研及发表论文情况}

{
  \noindent \sanhao \bf 科研情况:
}

\begin{enumerate}[label*=项目\arabic*：, leftmargin=*, labelindent=\parindent, itemindent=6em]
 \item
   \item
\end{enumerate}

{
   \noindent \sanhao \bf 论文发表情况:
}

\begin{enumerate}[label*=发表\arabic*：, leftmargin=*, labelindent=\parindent, itemindent=6em]
 \item Gerald Tesauro, et al. A hybrid reinforcement learning approach to autonomic resource allocation[C]. IEEE International Conference on Autonomic Computing. 2006.
 \item
\end{enumerate}
```

## 1.2 字体与文本设置

### 1.2.1 中文字体

模板预定义了符合规范的中文字体族，系统会自动根据章节标题（黑体）和正文（宋体）切换，但在需要强调时可手动指定 。

**表 1.3：常用字体命令对照表**

| 命令 | 说明 | 示例 | 备注 |
| --- | --- | --- | --- |
| `\song` | 宋体 | 东北大学 (Northeastern University) | 正文默认 |
| `\hei` | 黑体 | **东北大学 (Northeastern University)** | 标题默认 |
| `\kai` | 楷体 | *东北大学 (Northeastern University)* | 摘要/强调 |
| `\fs` | 仿宋 | 东北大学 (Northeastern University) | 很少使用 |

### 1.2.2 文字强调

正文中请使用以下标准命令进行强调 ：

* **加粗**：使用 `\textbf{文字}`。
* **斜体**：使用 `\textit{文字}`（中文环境通常显示为楷体）。

## 1.3 公式排版

### 1.3.1 公式环境

* **行内公式**：请使用 `$ ... $` 包裹，例如 。
* **行间公式**：推荐使用 `equation` 环境，以便自动生成编号 。

### 1.3.2 公式引用

引用公式时，请务必使用模板定义的 `\equref{label}` 命令 。

* **正确示例**：如**式 1.1** 所示（会自动添加“式”字前缀）。
* **错误示例**：如公式 1.1 所示。

## 1.4 图表双语标题规范

根据学校要求，图和表必须包含中英双语标题。模板封装了命令来简化此操作 。

### 1.4.1 图片的插入

* **命令**：使用 `\twofigcaption{label}{中文标题}{英文标题}`。
* **位置**：图片标题应位于图片**下方** 。
* **引用**：使用 `\figref{label}`，效果为：图 1.1 。

* **TikZ 绘图建议**：tikz绘图建议：Tikz绘图涉及多次调整。建议先在`figure-pdf.tex`中单独绘制。绘制完成后，创建一个tex文件，引入到主文档中。`figure-pdf.tex`和`main.tex`都共享`tikzbase.sty`。若要加入新的tikz 库引用，建议改动该文件，从而使tikz依赖一致。

### 1.4.2 表格的插入

* **命令**：使用 `\twotabcaption{label}{中文标题}{英文标题}`。
* **位置**：表格标题应位于表格**上方** 。
* **样式**：推荐使用三线表 (`booktabs`)。
* **引用**：使用 `\tabref{label}`，效果为：表 1.4 。

## 1.5 参考文献引用

模板支持两种引用模式，请根据语境选择 ：

1. **上标模式 (`\upcite`)**：用于陈述事实或观点时。

* *示例*：已有研究表明深度学习在图像识别中表现优异$^{[1]}$。

2. **正文模式 (`\cite`)**：用于文献作为句子成分（如主语）时。

* *示例*：文献 [1] 详细讨论了这一问题。

## 1.6 算法伪代码

对于计算机类专业的论文，模板已预置 `algorithm` 和 `algorithmic` 宏包 。

**代码结构示例**：

```latex
\begin{algorithm}
  \caption{自适应学习率调整算法}
  \begin{algorithmic}[1]
    \REQUIRE Initial learning rate $\alpha_0$, decay rate
    \ENSURE Updated parameters
    \STATE Initialize $t \leftarrow 0$
    \WHILE{not converged}
      \STATE $t \leftarrow t + 1$
      \STATE $\alpha_t \leftarrow \alpha_0 / (1 + \gamma t)$
      \STATE Update $\theta_t$ using gradient descent with $\alpha_t$
    \ENDWHILE
    \RETURN $\theta_t$
  \end{algorithmic}
\end{algorithm}

```

## 1.7 其他注意事项

- **列表环境**：模板优化了 `itemize` 和 `enumerate` 的间距，使其更符合中文排版习惯 。
- **编译方式**：推荐使用 LaTeX 结合 `xelatex` 编译，确保中文字体和文献正确渲染 。