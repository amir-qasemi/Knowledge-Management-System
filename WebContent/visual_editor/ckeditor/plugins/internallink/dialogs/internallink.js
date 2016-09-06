/**
 * author: AmirH Qasemi
 */

CKEDITOR.dialog
		.add(
				'internallinkDialog',
				function(editor) {
					return {
						title : 'Internal Link Insertion',
						minWidth : 400,
						minHeight : 200,
						contents : [ {
							id : 'anotherPageInternalLink',
							label : 'Link to Another Page:',
							elements : [
									{
										type : 'text',
										id : 'linkName',
										label : 'Link Name:',
										validate : CKEDITOR.dialog.validate
												.notEmpty("Link name field cannot be empty."),
										setup : function(element) {
											this.setValue(element);
										}
									},
									{
										type : 'hbox',
										align : 'right',
										widths : [ '25%', '75%' ],
										children : [

												{
													type : 'select',
													id : 'linkWebsiteSection',
													label : 'Website: ',
													items : [ [ 'www.kms.com/wiki/' ] ],
													'default' : 'www.kms.com/wiki/',
													onChange : function(api) {
														// this =
														// CKEDITOR.ui.dialog.select
														alert('Current value: '
																+ this
																		.getValue());
													}
												},
												{
													type : 'text',
													id : 'link',
													label : 'Page: ',
													validate : CKEDITOR.dialog.validate
															.notEmpty("Link field cannot be empty."),

													commit : function(e) {

														this.setValue(e);

													},
													setup : function(element) {
														this.setValue(element);
													}
												} ]
									},
									{
										type : 'select',
										id : 'headerSelect',
										label : 'Select your refrence in the page:',
										items : [ [ '' ] ],
										'default' : '',
										onChange : function(api) {
											// this = CKEDITOR.ui.dialog.select
											alert('Current value: '
													+ this.getValue());
										}
									} ]
						} ],
						onOk : function() {
							var dialog = this;
							console.log(dialog.getValueOf(
									'anotherPageInternalLink', 'linkWebsiteSection'));
							var abbr = editor.document.createElement('a');
							abbr.setAttribute('href',dialog.getValueOf(
									'anotherPageInternalLink', 'linkWebsiteSection') + dialog.getValueOf(
									'anotherPageInternalLink', 'link'));
							abbr.setAttribute('title',dialog.getValueOf(
									'anotherPageInternalLink', 'linkWebsiteSection') + dialog.getValueOf(
									'anotherPageInternalLink', 'link'));
							abbr.setText(dialog.getValueOf(
									'anotherPageInternalLink', 'linkName'));

							editor.insertElement(abbr);
							this.commitContent();
						},

						onShow : function() {
							var dialog = this;
														
							dialog.setupContent(editor.getSelectedHtml(true).replace(/<[^>]*>/g, ""));
							
							

							dialog.linkNamePreviousValue = dialog.getValueOf(
									'anotherPageInternalLink', 'linkName');

							window.onkeyup = function(e) {
								// this.commitContent(undefined);
								if (!(dialog.getValueOf(
										'anotherPageInternalLink', 'linkName') === dialog.linkNamePreviousValue)) {
									dialog.commitContent(dialog.getValueOf(
											'anotherPageInternalLink',
											'linkName'));
									dialog.linkNamePreviousValue = dialog
											.getValueOf(
													'anotherPageInternalLink',
													'linkName');
								}
							};

						}
					};
				});
