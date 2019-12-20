/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function (config) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

	// 介面語言，預設為 'en' 

	config.language = 'zh-cn';

	// 設定寬高 

	// config.width = 400;

	// config.height = 100;

	config.toolbarGroups = [
		{ name: 'document', groups: ['mode', 'document', 'doctools'] },
		{ name: 'clipboard', groups: ['clipboard', 'undo'] },
		{ name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
		{ name: 'forms', groups: ['forms'] },
		// '/',
		{ name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
		{ name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
		{ name: 'links', groups: ['links'] },
		{ name: 'insert', groups: ['insert'] },
		'/',
		{ name: 'styles', groups: ['styles'] },
		{ name: 'colors', groups: ['colors'] },
		{ name: 'tools', groups: ['tools'] },
		{ name: 'others', groups: ['others'] },
		{ name: 'about', groups: ['about'] }
	];

	config.removeButtons = 'NewPage,Form,Checkbox,Radio,Button,ImageButton,HiddenField,Outdent,Anchor,Flash,Table,HorizontalRule,Iframe,Styles,Format,Source,Print,About,TextField,Textarea,Select';
	config.fontSize_sizes = '12/12px;13/13px;16/16px;15/15px;18/18px;20/20px;22/22px;24/24px;36/36px;48/48px;';
	config.font_names = 'Arial;Arial Black;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana;新細明體;細明體;標楷體;微軟正黑體';
	config.allowedContent=true;

	config.extraPlugins = 'youtube';
	config.extraPlugins = 'simplebox';
	
	// The default plugins included in the basic setup define some buttons that
	// are not needed in a basic editor. They are removed here.
	// config.removeButtons = 'Cut,Copy,Paste,Undo,Redo,Anchor,Underline,Strike,Subscript,Superscript';

	// Dialog windows are also simplified.
	config.removeDialogTabs = 'link:advanced';
};
