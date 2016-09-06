
<script type="text/javascript">
	try {
		ace.settings.loadState('main-container')
	} catch (e) {
	}
</script>

<div id="sidebar"
	class="sidebar                  responsive                    ace-save-state">
	<script type="text/javascript">
		try {
			ace.settings.loadState('sidebar')
		} catch (e) {
		}
	</script>

	<div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<button class="btn btn-success">
				<i class="ace-icon fa fa-signal"></i>
			</button>

			<button class="btn btn-info">
				<i class="ace-icon fa fa-pencil"></i>
			</button>

			<a href="seeList" class="btn btn-warning"> <i
				class="ace-icon fa fa-users"></i>
			</a>

			<button class="btn btn-danger">
				<i class="ace-icon fa fa-cogs"></i>
			</button>

		</div>

		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span> <span class="btn btn-info"></span>

			<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
		</div>
	</div>
	<!-- /.sidebar-shortcuts -->

	<ul class="nav nav-list">
		<li class=""><a type="submit" href="dashboardRedirect"> <i
				class="menu-icon fa fa-tachometer"></i> <span
				id="sidebarDashboardRedirect" class="menu-text"> Dashboard </span>
		</a> <b class="arrow"></b></li>
	</ul>

	<ul class="nav nav-list">
		<li class=""><a type="submit" href="seeMesaages"> <i
				class="menu-icon fa fa-envelope-o fa-2x"></i> <span
				id="sidebarDashboardRedirect" class="menu-text"> Received
					messages </span>
		</a> <b class="arrow"></b></li>
	</ul>

	<ul class="nav nav-list">
		<li class=""><a type="submit" href="seeUploadedFiles"> <i
				class="menu-icon fa fa-files-o"></i> <span
				id="sidebarDashboardRedirect" class="menu-text"> Received
					files </span>
		</a> <b class="arrow"></b></li>
	</ul>

	<ul class="nav nav-list">
		<li class=""><a type="submit" href="sendMessageRedirect"> <i
				class="menu-icon fa fa-bullhorn"></i> <span
				id="sidebarDashboardRedirect" class="menu-text"> Send message
			</span>
		</a> <b class="arrow"></b></li>
	</ul>

	<ul class="nav nav-list">
		<li class=""><a type="submit" href="sendFileRedirect"> <i
				class="menu-icon fa fa-upload"></i> <span
				id="sidebarDashboardRedirect" class="menu-text"> Send file </span>
		</a> <b class="arrow"></b></li>
	</ul>

	<ul class="nav nav-list">
		<li class=""><a type="submit" href="wikiPage"> <i
				class="menu-icon fa fa-stack-overflow"></i> <span
				id="sidebarDashboardRedirect" class="menu-text"> wiki</span>
		</a> <b class="arrow"></b></li>
	</ul>

	<!-- /.nav-list -->

	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i id="sidebar-toggle-icon"
			class="ace-icon fa fa-angle-double-left ace-save-state"
			data-icon1="ace-icon fa fa-angle-double-left"
			data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>

</div>
<!-- end side bar -->
