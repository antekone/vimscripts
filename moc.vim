fu! FindWScriptDir()
	let l:path_tokens = split(expand('%:p'), '/')
	for ltry in range(len(l:path_tokens) - 2, 0, -1)
		let l:tmp_path = '/'.join(l:path_tokens[0:ltry], '/')
		if filereadable(join([l:tmp_path, 'wscript'], '/'))
			return l:tmp_path
		endif
	endfor
	return -1
endfunction

fu! InsertHeaderGuard()
	let l:lines = line("$")
	let l:idx = 0

	let l:generated_guard = "__hdr_" . expand('%:t:r') . "_h_"
	echo l:generated_guard

	while l:idx < l:lines
		if match(getline(l:idx), "^#ifndef " . l:generated_guard) != -1
			echo "Guard found at line " . l:idx ", not casting HeaderGuard magic."
			return
		endif
		let l:idx += 1
	endwhile

	call setline(1, "#ifndef " . l:generated_guard)
	call setline(2, "#define " . l:generated_guard)
	call setline(3, "// enter code here")
	call setline(4, "")
	call setline(5, "#endif // " . l:generated_guard)

	/enter code here
	d
endfunction

fu! InsertDialogClass()
	let l:fn = expand('%:t:r')
	let l:lines = []
	let l:lines += ["#include <QDialog>"]
	let l:lines += ["#include \"state/StatePersistenceAware.h\""]
	let l:lines += ["#include \"ui_". l:fn .".h\""]
	let l:lines += [""]
	let l:lines += ["BEGIN_ERROR_DEFS_NS(". l:fn ."Error)"]
	let l:lines += ["DECLARE_ERROR(PlaceholderError) { }"]
	let l:lines += ["END_ERROR_DEFS_NS"]
	let l:lines += [""]
	let l:lines += ["class ". l:fn .": public QDialog, public virtual StatePersistenceAware {"]
	let l:lines += ["	Q_OBJECT"]
	let l:lines += [""]
	let l:lines += ["private:"]
	let l:lines += ["	Ui::". l:fn ." ui;"]
	let l:lines += [""]
	let l:lines += ["	void saveSettings();"]
	let l:lines += ["	bool validate();"]
	let l:lines += [""]
	let l:lines += ["private Q_SLOTS:"]
	let l:lines += [""]
	let l:lines += ["public:"]
	let l:lines += ["	". l:fn ."(StatePersistence& sparent);"]
	let l:lines += ["	virtual ~". l:fn ."();"]
	let l:lines += [""]
	let l:lines += ["	void done(int r);"]
	let l:lines += [""]
	let l:lines += ["};"]
	let l:lines += [""]
	call append(".", l:lines)
endfunction

fu! InsertDialogImplClass()
	let l:fn = expand('%:t:r')
	let l:lines = []
	let l:lines += ["#include \"". l:fn .".h\""]
	let l:lines += [""]
	let l:lines += [l:fn ."::". l:fn ."(StatePersistence& sparent): StatePersistenceAware(sparent, \"". l:fn ."\") {"]
	let l:lines += ["	ui.setupUi(this);"]
	let l:lines += ["	P_LOAD_SIZE;"]
	let l:lines += [""]
	let l:lines += ["	setWindowTitle(tr(\"". l:fn ."\"));"]
	let l:lines += ["}"]
	let l:lines += [""]
	let l:lines += [l:fn ."::~". l:fn ."() {"]
	let l:lines += ["	saveSettings();"]
	let l:lines += ["}"]
	let l:lines += [""]
	let l:lines += ["void ". l:fn ."::saveSettings() {"]
	let l:lines += ["	P_SAVE_SIZE;"]
	let l:lines += ["}"]
	let l:lines += [""]
	let l:lines += ["bool ". l:fn ."::validate() {"]
	let l:lines += ["	// TODO: code here"]
	let l:lines += ["	return false; // return true if all is ok"]
	let l:lines += ["}"]
	let l:lines += [""]
	let l:lines += ["void ". l:fn ."::done(int r) {"]
	let l:lines += ["	if(r == QDialog::Accepted) {"]
	let l:lines += ["		// TODO: code here"]
	let l:lines += ["		if(! validate()) return;"]
	let l:lines += ["	}"]
	let l:lines += [""]
	let l:lines += ["	QDialog::done(r); // closes the dialog"]
	let l:lines += ["}"]
	call append(".", l:lines)
endfunction

fu! InsertClass()
	let l:filename = expand('%:t:r')
	let l:extension = expand('%:t:e')
	if match(l:filename, "Dialog$") != -1
		if l:extension == "h"
			call InsertHeaderGuard()
			call InsertDialogClass()
		elseif l:extension == "cpp"
			call InsertDialogImplClass()
			call InsertMocTag()
		else
			echo "Dialog class selected, but don't know what type of file is this."
			return
		endif
	else
		echo "Not sure which class you want to create."
		return
	endif
endfunction

fu! InsertMocTag()
	let l:lines = line("$")
	let l:idx = 0
	while l:idx < l:lines
		if match(getline(l:idx), "^#ifdef MOC") != -1
			echo "Magic found at line " . l:idx . ", not casting MOC magic."
			return
		endif
		let l:idx += 1
	endwhile

	let l:basedir = FindWScriptDir()
	if l:basedir == -1
		echo "Base dir not found, sorry"
		return
	endif

	let l:mocpath = substitute(expand('%:p')[1 + len(l:basedir):-1], "\\..*", "", "") . ".moc"

	call setline(1 + l:lines, "")
	call setline(2 + l:lines, "#ifdef MOC")
	call setline(3 + l:lines, "#include \"". l:mocpath ."\"")
	call setline(4 + l:lines, "#endif")
endfunction
