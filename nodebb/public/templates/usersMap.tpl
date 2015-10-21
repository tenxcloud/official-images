<div class="users">

<!-- IF breadcrumbs.length -->
<ol class="breadcrumb">
	<!-- BEGIN breadcrumbs -->
	<li<!-- IF @last --> component="breadcrumb/current"<!-- ENDIF @last --> itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb" <!-- IF @last -->class="active"<!-- ENDIF @last -->>
		<!-- IF !@last --><a href="{breadcrumbs.url}" itemprop="url"><!-- ENDIF !@last -->
			<span itemprop="title">
				{breadcrumbs.text}
				<!-- IF @last -->
				<!-- IF !feeds:disableRSS -->
				<!-- IF rssFeedUrl --><a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a><!-- ENDIF rssFeedUrl --><!-- ENDIF !feeds:disableRSS -->
				<!-- ENDIF @last -->
			</span>
		<!-- IF !@last --></a><!-- ENDIF !@last -->
	</li>
	<!-- END breadcrumbs -->
</ol>
<!-- ENDIF breadcrumbs.length -->

<ul class="nav nav-pills">
	<li><a href='{config.relative_path}/users/online'>[[global:online]]</a></li>
	<li><a href='{config.relative_path}/users/sort-posts'>[[users:top_posters]]</a></li>
	<!-- IF !reputation:disabled -->
	<li><a href='{config.relative_path}/users/sort-reputation'>[[users:most_reputation]]</a></li>
	<!-- ENDIF !reputation:disabled -->
	<li><a href='{config.relative_path}/users/map'>[[users:map]]</a></li>
	<!-- IF function.displayUserSearch, {config.allowGuestUserSearching} -->
	<li><a href='{config.relative_path}/users/search'>[[users:search]]</a></li>
	<!-- ENDIF function.displayUserSearch -->
	<!-- IF inviteOnly -->
	<button component="user/invite" class="btn btn-success pull-right"><i class="fa fa-users"></i> [[users:invite]]</button>
	<!-- ENDIF inviteOnly -->
</ul>

	<br />

	<ul id="users-container" class="users-container rooms">

		<!-- BEGIN rooms -->
		<!-- IF rooms.total -->
		<li>
			<a href="{config.relative_path}{rooms.link}"><!-- IF rooms.core -->[[users:{rooms.room}]]<!-- ELSE -->{rooms.room}<!-- ENDIF rooms.core --></a><br/>
			<!-- BEGIN rooms.users -->
				<a href="{config.relative_path}/user/{rooms.users.userslug}"><img class="user-img" src="{rooms.users.picture}" title="{rooms.users.username}"/></a>
			<!-- END rooms.users -->
		</li>
		<!-- ENDIF rooms.total -->
		<!-- END rooms -->

	</ul>

</div>
