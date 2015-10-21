

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

<div class="account">
	<div class="row">
		<div class="col-md-2">
			<div class="account-picture-block text-center">
				<img id="user-current-picture" class="user-profile-picture" src="{picture}" /><br /><br />
				<a id="changePictureBtn" href="#" class="btn btn-default">[[user:change_picture]]</a>
				<br/><br/>

				<!-- IF !username:disableEdit -->
				<a href="{config.relative_path}/user/{userslug}/edit/username" class="btn btn-default">[[user:change_username]]</a><br/><br/>
				<!-- ENDIF !username:disableEdit -->

				<a href="{config.relative_path}/user/{userslug}/edit/email" class="btn btn-default">[[user:change_email]]</a><br/><br/>

				<a href="{config.relative_path}/user/{userslug}/edit/password" class="btn btn-default">[[user:change_password]]</a><br/><br/>

				<!-- IF config.requireEmailConfirmation -->
				<!-- IF email -->
				<!-- IF isSelf -->
				<a id="confirm-email" href="#" class="btn btn-warning <!-- IF email:confirmed -->hide<!-- ENDIF email:confirmed -->">[[user:confirm_email]]</a><br/><br/>
				<!-- ENDIF isSelf -->
				<!-- ENDIF email -->
				<!-- ENDIF config.requireEmailConfirmation -->

				<!-- IF config.allowAccountDelete -->
				<!-- IF isSelf -->
				<a id="deleteAccountBtn" href="#" class="btn btn-danger">[[user:delete_account]]</a><br/><br/>
				<!-- ENDIF isSelf -->
				<!-- ENDIF config.allowAccountDelete -->

			</div>
		</div>

		<div class="col-md-5">
			<div>
				<form class='form-horizontal'>

					<div class="control-group">
						<label class="control-label" for="inputFullname">[[user:fullname]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputFullname" placeholder="[[user:fullname]]" value="{fullname}">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputWebsite">[[user:website]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputWebsite" placeholder="http://..." value="{website}">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputLocation">[[user:location]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputLocation" placeholder="[[user:location]]" value="{location}">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputBirthday">[[user:birthday]]</label>
						<div class="controls">
							<input class="form-control" id="inputBirthday" value="{birthday}" placeholder="yyyy-mm-dd">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputAboutMe">[[user:aboutme]]</label> <small><label id="aboutMeCharCountLeft"></label></small>
						<div class="controls">
							<textarea class="form-control" id="inputAboutMe" rows="5">{aboutme}</textarea>
						</div>
					</div>
					<!-- IF !disableSignatures -->
					<div class="control-group">
						<label class="control-label" for="inputSignature">[[user:signature]]</label> <small><label id="signatureCharCountLeft"></label></small>
						<div class="controls">
							<textarea class="form-control" id="inputSignature" rows="5">{signature}</textarea>
						</div>
					</div>
					<!-- ENDIF !disableSignatures -->

					<input type="hidden" id="inputUID" value="{uid}"><br />

					<div class="form-actions">
						<a id="submitBtn" href="#" class="btn btn-primary">[[global:save_changes]]</a>
					</div>

				</form>
			</div>

			<hr class="visible-xs visible-sm"/>
		</div>

		<div class="col-md-5">
			<!-- IF sso.length -->
			<label class="control-label">[[user:sso.title]]</label>
			<div class="list-group">
				<!-- BEGIN sso -->
				<a class="list-group-item" href="{../url}" target="<!-- IF ../associated -->_blank<!-- ELSE -->_top<!-- ENDIF ../associated -->">
					<!-- IF ../icon --><i class="fa {../icon}"></i><!-- ENDIF ../icon -->
					<!-- IF ../associated -->[[user:sso.associated]]<!-- ELSE -->[[user:sso.not-associated]]<!-- ENDIF ../associated -->
					{../name}
				</a>
				<!-- END sso -->
			</div>
			<!-- ENDIF sso.length -->
		</div>
	</div>
</div>

