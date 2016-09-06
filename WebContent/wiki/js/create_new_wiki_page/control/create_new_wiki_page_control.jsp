<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
	$(document)
			.ready(
					function() {

						// this section for editor actions ........................................................
						var initiated = false;

						function initEditor() {
							CKEDITOR.replace('editor1');
							initiated = true;
							showEditor();
						}

						function showEditor() {
							$("#visualEditor").show();
						}

						function hideEditor() {
							$("#visualEditor").hide();
						}

						/**
						 * Every page which wants to have this editor should
						 * implement these two functions: 
						 *     saveChanges(var data)
						 *     cancelChanges()
						 */
						$("#saveChangesBtn").on(
								"click",
								function() {
									if (typeof saveChanges === 'function') {
										saveChanges(CKEDITOR.instances.editor1
												.getData());
									}
								});

						$("#cancelChangesBtn").on("click", function() {
							if (typeof cancelChanges === 'function') {
								cancelChanges();
							}
						});

						var i = false;
						function my(value) {
							if (i === false) {
								initEditor();
								showEditor();
								i = true;
								$("#editor1").val(value);
							} else {
								$("#editor1").reset();
								$("#editor1").val(value);
								showEditor();
							}
						}

						function cancelChanges() {
							$("#editor1").reset();
						}

						function saveChanges(e) {

							$("submit").click();
							alert(e);
							$("#editor1").reset();
						}
						//..................editor................................^

						$(".itemize p").wrap(
								"<div class='col col-xs-12'></div>");
						$(".itemize p")
								.append(
										"[<strong><a href='#EditorDiv' class='Editor'>Edit</a></strong>]");

						my();

						var arrowDirectionRight = false;
						$("#menu-toggle").click(
								function(e) {
									e.preventDefault();
									if (arrowDirectionRight) {
										$("#menu-toggle").removeClass(
												"fa-angle-double-right");
										$("#menu-toggle").addClass(
												"fa-angle-double-left");
										arrowDirectionRight = false;
									} else {
										$("#menu-toggle").removeClass(
												"fa-angle-double-left");
										$("#menu-toggle").addClass(
												"fa-angle-double-right");
										arrowDirectionRight = true;
									}
									$("#wrapper").toggleClass("toggled");
								});
					});
</script>
