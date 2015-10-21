
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

<div class="account-username-box" data-userslug="{userslug}" data-uid="{uid}">
	<ul class="nav nav-pills account-sub-links">
		<li>
			<a href="#" type="button" class="dropdown-toggle inline-block" data-toggle="dropdown">
				[[user:more]]
				<span class="caret"></span>
				<span class="sr-only">Toggle Dropdown</span>
			</a>
			<ul class="dropdown-menu pull-right" role="menu">
				<li><a href="{config.relative_path}/user/{userslug}/following"><i class="fa fa-fw fa-users"></i> [[user:following]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/followers"><i class="fa fa-fw fa-users"></i> [[user:followers]]</a></li>
				<li class="divider"></li>
				<li><a href="{config.relative_path}/user/{userslug}/topics"><i class="fa fa-fw fa-book"></i> [[global:topics]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/posts"><i class="fa fa-fw fa-pencil"></i> [[global:posts]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/groups"><i class="fa fa-fw fa-users"></i> [[global:header.groups]]</a></li>
				<!-- IF showHidden -->
				<li><a href="{config.relative_path}/user/{userslug}/favourites"><i class="fa fa-fw fa-heart"></i> [[user:favourites]]</a></li>
				<li><a href="{config.relative_path}/user/{userslug}/watched"><i class="fa fa-fw fa-eye"></i> [[user:watched]]</a></li>
				<!-- ENDIF showHidden -->
				<!-- BEGIN profile_links -->
				<li id="{profile_links.id}" class="plugin-link <!-- IF profile_links.public -->public<!-- ELSE -->private<!-- ENDIF profile_links.public -->"><a href="{config.relative_path}/user/{userslug}/{profile_links.route}"><i class="fa fa-fw {profile_links.icon}"></i> {profile_links.name}</a></li>
				<!-- END profile_links -->
			</ul>
		</li>
		<li>
			<a href="{config.relative_path}/user/{userslug}" class="inline-block" id="profile"><i class="fa fa-user"></i> [[user:profile]]</a>
		</li>
		<!-- IF showHidden -->
		<li><a href="{config.relative_path}/user/{userslug}/settings"><i class="fa fa-gear"></i> [[user:settings]]</a></li>
		<li><a href="{config.relative_path}/user/{userslug}/edit"><i class="fa fa-pencil-square-o"></i> [[user:edit]]</a></li>
		<!-- ENDIF showHidden -->
	</ul>
</div>

<div class="col-md-5">
	<form class="form-horizontal">

		<div class="control-group">
			<label class="control-label" for="inputNewUsername">[[user:username]]</label>
			<div class="controls">
				<input class="form-control" type="text" id="inputNewUsername" placeholder="[[user:username]]" value="{username}">
			</div>
		</div>

		<!-- disables autocomplete on FF --><input type="password" style="display:none">

		<!-- IF isSelf -->
		<div class="control-group">
			<label class="control-label" for="inputCurrentPassword">[[user:current_password]]</label>
			<div class="controls">
				<input autocomplete="off" class="form-control" type="password" id="inputCurrentPassword" placeholder="[[user:current_password]]" value=""<!-- IF !hasPassword --> disabled<!-- ENDIF !hasPassword-->>
			</div>
		</div>
		<!-- ENDIF isSelf -->

		<input type="hidden" name="uid" id="inputUID" value="{uid}" />

		<br/>
		<div class="form-actions">
			<a id="submitBtn" href="#" class="btn btn-primary"><i class="hide fa fa-spinner fa-spin"></i> [[user:change_username]]</a>
		</div>
	</form>
</div>