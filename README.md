# hotcrp-review-mode.el

A major mode for editing HotCRP review files in Emacs with syntax highlighting.

## Installation

### Via straight

```elisp
(straight-use-package
 '(hotcrp-review-mode :type git :host github :repo "jaybosamiya/hotcrp-review-mode.el"))
```

### Doom Emacs

Add to your `packages.el`:

```elisp
(package! hotcrp-review-mode :recipe (:host github :repo "jaybosamiya/hotcrp-review-mode.el"))
```

### Manual Installation

Clone this repository and add it to your load path:

```bash
git clone https://github.com/jaybosamiya/hotcrp-review-mode.el.git
```

```elisp
(add-to-list 'load-path "/path/to/hotcrp-review-mode.el")
(require 'hotcrp-review-mode)
```

## Usage

Opening a HotCRP review file (i.e., a file that starts with either `==*==` or `==+==`) should automatically invoke this mode after installation. However, if needed, you can manually enable it via:

```
M-x hotcrp-review-mode RET
```
