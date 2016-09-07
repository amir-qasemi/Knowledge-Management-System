<script type="text/javascript">

	// Create a "close" button and append it to each list item
	var myNodelist = document.getElementsByTagName("LI");
	var i;
	for (i = 0; i < myNodelist.length; i++) {
		var span = document.createElement("SPAN");
		var txt = document.createTextNode("\u00D7");
		span.className = "close";
		span.appendChild(txt);
		myNodelist[i].appendChild(span);
	}

	// Click on a close button to hide the current list item
	var close = document.getElementsByClassName("close");
	var i;
	for (i = 0; i < close.length; i++) {
		close[i].onclick = function() {
			var div = this.parentElement;
			div.style.display = "none";
		}
	}

	// Add a "checked" symbol when clicking on a list item
	var list = document.querySelector('ul');
	list.addEventListener('click', function(ev) {
		if (ev.target.tagName === 'LI') {
			ev.target.classList.toggle('checked');
		}
	}, false);

	// Create a new list item when clicking on the "Add" button
	function newElement() {
		var li = document.createElement("li");
		var inputValue = document.getElementById("myInput").value;
		var t = document.createTextNode(inputValue);
		li.appendChild(t);
		if (inputValue === '') {
			alert("You must write something!");
		} else {
			//add todo after getting request result................
			document.getElementById("myUL").appendChild(li);
			
			
			ajaxGetTodo().done(function(data) {
				$("body").append(data);
				if(isSet){
					console.log("Add it");
				} else {
					console.log("No Add it");
				}
			}).fail(function(xhr, status, errorThrow) {
				allert("Ajax Error :" + errorThrow);
			}).always(function(xhr, status) {
				// alert("Ajax Finished -> press f12 -> go to console tab");
			});
		}
		document.getElementById("myInput").value = "";

		var span = document.createElement("SPAN");
		var txt = document.createTextNode("\u00D7");
		span.className = "close";
		span.appendChild(txt);
		li.appendChild(span);

		for (i = 0; i < close.length; i++) {
			close[i].onclick = function() {
				var div = this.parentElement;
				div.style.display = "none";
			}
		}
		
	}
	
	
	function ajaxGetTodo() {
		var dynamicdata = {};
		dynamicdata["description"] = $("#myInput").val();
		return $.ajax({
			url : "addTodo",
			type : "post",
			data : dynamicdata
		});
	}
</script>