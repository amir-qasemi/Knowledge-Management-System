/**
 * author: AmirH Qasemi
 */
CKEDITOR.plugins.add( 'internallink', {
    icons: 'internallink',
    init: function( editor ) {
    	editor.addCommand( 'internallink', new CKEDITOR.dialogCommand( 'internallinkDialog' ) );
    	editor.ui.addButton( 'internallink', {
    	    label: 'Insert Internal Link',
    	    command: 'internallink',
    	    toolbar: 'links'
    	});
    	
    	CKEDITOR.dialog.add( 'internallinkDialog', this.path + 'dialogs/internallink.js' );	
    }
});