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

<div component="groups/container" class="details row">
	<div class="col-xs-12" component="groups/cover" style="background-origin: content-box; background-image: url({group.cover:url}); background-position: {group.cover:position};">
		<div class="change">[[groups:cover-change]] <i class="fa fa-fw fa-pencil-square-o"></i></div>
		<div class="save">[[groups:cover-save]] <i class="fa fa-fw fa-floppy-o"></i></div>
		<div class="indicator">[[groups:cover-saving]] <i class="fa fa-fw fa-refresh fa-spin"></i></div>
		<div class="instructions">[[groups:cover-instructions]]</div>
	</div>
	<div class="col-lg-6 col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-list-ul"></i> [[groups:details.title]]
					<!-- IF group.private --><span class="label label-info">[[groups:details.private]]</span><!-- ENDIF group.private -->
					<!-- IF group.hidden --><span class="label label-info">[[groups:details.hidden]]</span>&nbsp;<!-- ENDIF group.hidden -->
				</h3>
			</div>
			<div class="panel-body">
				<h1>{group.displayName}</h1>
				<p>{group.descriptionParsed}</p>
				<!-- IF isAdmin -->
				<div class="pull-right">
					<a href="{config.relative_path}/admin/manage/groups/{group.nameEncoded}" target="_blank" class="btn btn-info"><i class="fa fa-gear"></i> [[user:edit]]</a>
				</div>
				<!-- ENDIF isAdmin -->
				<!-- IF loggedIn -->
				<div class="pull-right">
					{function.membershipBtn, group}&nbsp;
				</div>
				<!-- ENDIF loggedIn -->
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-users"></i> [[groups:details.members]]</h3>
			</div>
			<div class="panel-body">
<input class="form-control" type="text" component="groups/members/search" placeholder="[[global:search]]"/><br/>
<table component="groups/members" class="table table-striped table-hover" data-nextstart="{group.membersNextStart}">
	<!-- BEGIN members -->
	<tr data-uid="{group.members.uid}">
		<td>
			<a href="{config.relative_path}/user/{group.members.userslug}"><img src="{group.members.picture}" /></a>
		</td>
		<td class="member-name">
			<a href="{config.relative_path}/user/{group.members.userslug}">{group.members.username}</a> <i title="[[groups:owner]]" class="fa fa-star text-warning <!-- IF !group.members.isOwner -->invisible<!-- ENDIF !group.members.isOwner -->"></i>
		</td>
		<!-- IF group.isOwner -->
		<td>
			<div class="btn-group pull-right">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					[[global:more]] <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a href="#" data-ajaxify="false" data-action="toggleOwnership">
							[[groups:details.grant]]
						</a>
					</li>
					<li>
						<a href="#" data-ajaxify="false" data-action="kick">
							[[groups:details.kick]]
						</a>
					</li>
				</ul>
			</div>
		</td>
		<!-- ENDIF group.isOwner -->
	</tr>
	<!-- END members -->
</table>
			</div>
		</div>
		<!-- IF group.isOwner -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title clearfix">
					<i class="fa fa-clock-o"></i> [[groups:details.pending]]
					<!-- IF group.pending.length -->
					<div class="btn-group pull-right">
						<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							[[global:more]] <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#" data-ajaxify="false" data-action="acceptAll">[[groups:pending.accept_all]]</a></li>
							<li><a href="#" data-ajaxify="false" data-action="rejectAll">[[groups:pending.reject_all]]</a></li>
						</ul>
					</div>
					<!-- ENDIF group.pending.length -->
				</h3>
			</div>
			<div class="panel-body">
				<table component="groups/pending" class="table table-striped table-hover">
					<!-- IF !group.pending.length -->
					<div class="alert alert-info">[[groups:pending.none]]</div>
					<!-- ENDIF !group.pending.length -->
					<!-- BEGIN pending -->
					<tr data-uid="{group.pending.uid}">
						<td>
							<a href="{config.relative_path}/user/{group.pending.userslug}"><img src="{group.pending.picture}" /></a>
						</td>
						<td class="member-name">
							<a href="{config.relative_path}/user/{group.pending.userslug}">{group.pending.username}</a>
						</td>
						<td>
							<div class="btn-group pull-right">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									[[global:more]] <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#" data-ajaxify="false" data-action="accept">[[groups:pending.accept]]</a></li>
									<li><a href="#" data-ajaxify="false" data-action="reject">[[groups:pending.reject]]</a></li>
								</ul>
							</div>
						</td>
					</tr>
					<!-- END pending -->
				</table>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title clearfix">
					<i class="fa fa-gift"></i> [[groups:details.invited]]
				</h3>
			</div>
			<div class="panel-body">
				<input class="form-control" type="text" component="groups/members/invite" placeholder="[[groups:invited.search]]"/><br/>
				<table component="groups/invited" class="table table-striped table-hover">
					<!-- IF !group.invited.length -->
					<div class="alert alert-info">[[groups:invited.none]]</div>
					<!-- ENDIF !group.invited.length -->
					<!-- BEGIN invited -->
					<tr data-uid="{group.invited.uid}">
						<td>
							<a href="{config.relative_path}/user/{group.invited.userslug}"><img src="{group.invited.picture}" /></a>
						</td>
						<td class="member-name">
							<a href="{config.relative_path}/user/{group.invited.userslug}">{group.invited.username}</a>
						</td>
						<td>
							<div class="btn-group pull-right">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									[[global:more]] <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#" data-ajaxify="false" data-action="rescindInvite">[[groups:invited.uninvite]]</a></li>
								</ul>
							</div>
						</td>
					</tr>
					<!-- END invited -->
				</table>
			</div>
		</div>
		<!-- ENDIF group.isOwner -->
		<div widget-area="left"></div>
	</div>
	<div class="col-lg-6 col-xs-12">
		<!-- IF group.isOwner -->
		<div class="panel panel-default">
			<div class="panel-heading pointer" data-toggle="collapse" data-target=".options">
				<h3 class="panel-title">
					<i class="fa fa-caret-down pull-right"></i>
					<i class="fa fa-cogs"></i> [[groups:details.owner_options]]
				</h3>
			</div>

			<div class="panel-body options collapse">
				<form component="groups/settings" role="form">
					<div class="form-group">
						<label for="name">[[groups:details.group_name]]</label>
						<input class="form-control" name="name" id="name" type="text" value="{group.displayName}" />
					</div>
					<div class="form-group">
						<label for="name">[[groups:details.description]]</label>
						<textarea class="form-control" name="description" id="description" type="text">{group.description}</textarea>
					</div>
					<div class="form-group user-title-option">
						<label for="userTitle">[[groups:details.badge_text]]</label>
						<input component="groups/userTitleOption" class="form-control" name="userTitle" id="userTitle" type="text" value="{group.userTitle}"<!-- IF !group.userTitleEnabled --> disabled<!-- ENDIF !group.userTitleEnabled --> />
					</div>

					<div class="form-group user-title-option">
						<label>[[groups:details.badge_preview]]</label><br />
						<span class="label<!-- IF !group.userTitleEnabled --> hide<!-- ENDIF !group.userTitleEnabled -->" style="background-color: {group.labelColor}"><i class="fa {group.icon} icon"></i> <!-- IF group.userTitle -->{group.userTitle}<!-- ELSE -->{group.displayName}<!-- ENDIF group.userTitle --></span>

						<button component="groups/userTitleOption" type="button" class="btn btn-default btn-sm" data-action="icon-select"<!-- IF !group.userTitleEnabled --> disabled<!-- ENDIF !group.userTitleEnabled -->>[[groups:details.change_icon]]</button>
						<button component="groups/userTitleOption" type="button" class="btn btn-default btn-sm" data-action="color-select"<!-- IF !group.userTitleEnabled --> disabled<!-- ENDIF !group.userTitleEnabled -->>[[groups:details.change_colour]]</button>
						<input type="hidden" name="labelColor" value="<!-- IF group.labelColor -->{group.labelColor}<!-- ENDIF group.labelColor -->" />
						<input type="hidden" name="icon" value="<!-- IF group.icon -->{group.icon}<!-- ENDIF group.icon -->" />
						<div id="icons" class="hidden">
							<div class="icon-container">
								<div class="row fa-icons">
									<i class="fa fa-doesnt-exist"></i>
<div class="icon-container">
	<div class="form-group">
		<label for="fa-filter">Type to filter icons</label>
		<input type="text" class="form-control" id="fa-filter" data-action="filter" placeholder="e.g. umbrella" />
	</div>
	<div class="row fa-icons">
		<i class="fa fa-adjust"></i><i class="fa fa-adn"></i><i class="fa fa-align-center"></i><i class="fa fa-align-justify"></i><i class="fa fa-align-left"></i><i class="fa fa-align-right"></i><i class="fa fa-ambulance"></i><i class="fa fa-anchor"></i><i class="fa fa-android"></i><i class="fa fa-angellist"></i><i class="fa fa-angle-double-down"></i><i class="fa fa-angle-double-left"></i><i class="fa fa-angle-double-right"></i><i class="fa fa-angle-double-up"></i><i class="fa fa-angle-down"></i><i class="fa fa-angle-left"></i><i class="fa fa-angle-right"></i><i class="fa fa-angle-up"></i><i class="fa fa-apple"></i><i class="fa fa-archive"></i><i class="fa fa-area-chart"></i><i class="fa fa-arrow-circle-down"></i><i class="fa fa-arrow-circle-left"></i><i class="fa fa-arrow-circle-o-down"></i><i class="fa fa-arrow-circle-o-left"></i><i class="fa fa-arrow-circle-o-right"></i><i class="fa fa-arrow-circle-o-up"></i><i class="fa fa-arrow-circle-right"></i><i class="fa fa-arrow-circle-up"></i><i class="fa fa-arrow-down"></i><i class="fa fa-arrow-left"></i><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-up"></i><i class="fa fa-arrows"></i><i class="fa fa-arrows-alt"></i><i class="fa fa-arrows-h"></i><i class="fa fa-arrows-v"></i><i class="fa fa-asterisk"></i><i class="fa fa-at"></i><i class="fa fa-backward"></i><i class="fa fa-ban"></i><i class="fa fa-bar-chart"></i><i class="fa fa-barcode"></i><i class="fa fa-bars"></i><i class="fa fa-beer"></i><i class="fa fa-behance"></i><i class="fa fa-behance-square"></i><i class="fa fa-bell"></i><i class="fa fa-bell-o"></i><i class="fa fa-bell-slash"></i><i class="fa fa-bell-slash-o"></i><i class="fa fa-bicycle"></i><i class="fa fa-binoculars"></i><i class="fa fa-birthday-cake"></i><i class="fa fa-bitbucket"></i><i class="fa fa-bitbucket-square"></i><i class="fa fa-bold"></i><i class="fa fa-bolt"></i><i class="fa fa-bomb"></i><i class="fa fa-book"></i><i class="fa fa-bookmark"></i><i class="fa fa-bookmark-o"></i><i class="fa fa-briefcase"></i><i class="fa fa-btc"></i><i class="fa fa-bug"></i><i class="fa fa-building"></i><i class="fa fa-building-o"></i><i class="fa fa-bullhorn"></i><i class="fa fa-bullseye"></i><i class="fa fa-bus"></i><i class="fa fa-calculator"></i><i class="fa fa-calendar"></i><i class="fa fa-calendar-o"></i><i class="fa fa-camera"></i><i class="fa fa-camera-retro"></i><i class="fa fa-car"></i><i class="fa fa-caret-down"></i><i class="fa fa-caret-left"></i><i class="fa fa-caret-right"></i><i class="fa fa-caret-square-o-down"></i><i class="fa fa-caret-square-o-left"></i><i class="fa fa-caret-square-o-right"></i><i class="fa fa-caret-square-o-up"></i><i class="fa fa-caret-up"></i><i class="fa fa-cc"></i><i class="fa fa-cc-amex"></i><i class="fa fa-cc-discover"></i><i class="fa fa-cc-mastercard"></i><i class="fa fa-cc-paypal"></i><i class="fa fa-cc-stripe"></i><i class="fa fa-cc-visa"></i><i class="fa fa-certificate"></i><i class="fa fa-chain-broken"></i><i class="fa fa-check"></i><i class="fa fa-check-circle"></i><i class="fa fa-check-circle-o"></i><i class="fa fa-check-square"></i><i class="fa fa-check-square-o"></i><i class="fa fa-chevron-circle-down"></i><i class="fa fa-chevron-circle-left"></i><i class="fa fa-chevron-circle-right"></i><i class="fa fa-chevron-circle-up"></i><i class="fa fa-chevron-down"></i><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right"></i><i class="fa fa-chevron-up"></i><i class="fa fa-child"></i><i class="fa fa-circle"></i><i class="fa fa-circle-o"></i><i class="fa fa-circle-o-notch"></i><i class="fa fa-circle-thin"></i><i class="fa fa-clipboard"></i><i class="fa fa-clock-o"></i><i class="fa fa-cloud"></i><i class="fa fa-cloud-download"></i><i class="fa fa-cloud-upload"></i><i class="fa fa-code"></i><i class="fa fa-code-fork"></i><i class="fa fa-codepen"></i><i class="fa fa-coffee"></i><i class="fa fa-cog"></i><i class="fa fa-cogs"></i><i class="fa fa-columns"></i><i class="fa fa-comment"></i><i class="fa fa-comment-o"></i><i class="fa fa-comments"></i><i class="fa fa-comments-o"></i><i class="fa fa-compass"></i><i class="fa fa-compress"></i><i class="fa fa-copyright"></i><i class="fa fa-credit-card"></i><i class="fa fa-crop"></i><i class="fa fa-crosshairs"></i><i class="fa fa-css3"></i><i class="fa fa-cube"></i><i class="fa fa-cubes"></i><i class="fa fa-cutlery"></i><i class="fa fa-database"></i><i class="fa fa-delicious"></i><i class="fa fa-desktop"></i><i class="fa fa-deviantart"></i><i class="fa fa-digg"></i><i class="fa fa-dot-circle-o"></i><i class="fa fa-download"></i><i class="fa fa-dribbble"></i><i class="fa fa-dropbox"></i><i class="fa fa-drupal"></i><i class="fa fa-eject"></i><i class="fa fa-ellipsis-h"></i><i class="fa fa-ellipsis-v"></i><i class="fa fa-empire"></i><i class="fa fa-envelope"></i><i class="fa fa-envelope-o"></i><i class="fa fa-envelope-square"></i><i class="fa fa-eraser"></i><i class="fa fa-eur"></i><i class="fa fa-exchange"></i><i class="fa fa-exclamation"></i><i class="fa fa-exclamation-circle"></i><i class="fa fa-exclamation-triangle"></i><i class="fa fa-expand"></i><i class="fa fa-external-link"></i><i class="fa fa-external-link-square"></i><i class="fa fa-eye"></i><i class="fa fa-eye-slash"></i><i class="fa fa-eyedropper"></i><i class="fa fa-facebook"></i><i class="fa fa-facebook-square"></i><i class="fa fa-fast-backward"></i><i class="fa fa-fast-forward"></i><i class="fa fa-fax"></i><i class="fa fa-female"></i><i class="fa fa-fighter-jet"></i><i class="fa fa-file"></i><i class="fa fa-file-archive-o"></i><i class="fa fa-file-audio-o"></i><i class="fa fa-file-code-o"></i><i class="fa fa-file-excel-o"></i><i class="fa fa-file-image-o"></i><i class="fa fa-file-o"></i><i class="fa fa-file-pdf-o"></i><i class="fa fa-file-powerpoint-o"></i><i class="fa fa-file-text"></i><i class="fa fa-file-text-o"></i><i class="fa fa-file-video-o"></i><i class="fa fa-file-word-o"></i><i class="fa fa-files-o"></i><i class="fa fa-film"></i><i class="fa fa-filter"></i><i class="fa fa-fire"></i><i class="fa fa-fire-extinguisher"></i><i class="fa fa-flag"></i><i class="fa fa-flag-checkered"></i><i class="fa fa-flag-o"></i><i class="fa fa-flask"></i><i class="fa fa-flickr"></i><i class="fa fa-floppy-o"></i><i class="fa fa-folder"></i><i class="fa fa-folder-o"></i><i class="fa fa-folder-open"></i><i class="fa fa-folder-open-o"></i><i class="fa fa-font"></i><i class="fa fa-forward"></i><i class="fa fa-foursquare"></i><i class="fa fa-frown-o"></i><i class="fa fa-futbol-o"></i><i class="fa fa-gamepad"></i><i class="fa fa-gavel"></i><i class="fa fa-gbp"></i><i class="fa fa-gift"></i><i class="fa fa-git"></i><i class="fa fa-git-square"></i><i class="fa fa-github"></i><i class="fa fa-github-alt"></i><i class="fa fa-github-square"></i><i class="fa fa-gittip"></i><i class="fa fa-glass"></i><i class="fa fa-globe"></i><i class="fa fa-google"></i><i class="fa fa-google-plus"></i><i class="fa fa-google-plus-square"></i><i class="fa fa-google-wallet"></i><i class="fa fa-graduation-cap"></i><i class="fa fa-h-square"></i><i class="fa fa-hacker-news"></i><i class="fa fa-hand-o-down"></i><i class="fa fa-hand-o-left"></i><i class="fa fa-hand-o-right"></i><i class="fa fa-hand-o-up"></i><i class="fa fa-hdd-o"></i><i class="fa fa-header"></i><i class="fa fa-headphones"></i><i class="fa fa-heart"></i><i class="fa fa-heart-o"></i><i class="fa fa-history"></i><i class="fa fa-home"></i><i class="fa fa-hospital-o"></i><i class="fa fa-html5"></i><i class="fa fa-ils"></i><i class="fa fa-inbox"></i><i class="fa fa-indent"></i><i class="fa fa-info"></i><i class="fa fa-info-circle"></i><i class="fa fa-inr"></i><i class="fa fa-instagram"></i><i class="fa fa-ioxhost"></i><i class="fa fa-italic"></i><i class="fa fa-joomla"></i><i class="fa fa-jpy"></i><i class="fa fa-jsfiddle"></i><i class="fa fa-key"></i><i class="fa fa-keyboard-o"></i><i class="fa fa-krw"></i><i class="fa fa-language"></i><i class="fa fa-laptop"></i><i class="fa fa-lastfm"></i><i class="fa fa-lastfm-square"></i><i class="fa fa-leaf"></i><i class="fa fa-lemon-o"></i><i class="fa fa-level-down"></i><i class="fa fa-level-up"></i><i class="fa fa-life-ring"></i><i class="fa fa-lightbulb-o"></i><i class="fa fa-line-chart"></i><i class="fa fa-link"></i><i class="fa fa-linkedin"></i><i class="fa fa-linkedin-square"></i><i class="fa fa-linux"></i><i class="fa fa-list"></i><i class="fa fa-list-alt"></i><i class="fa fa-list-ol"></i><i class="fa fa-list-ul"></i><i class="fa fa-location-arrow"></i><i class="fa fa-lock"></i><i class="fa fa-long-arrow-down"></i><i class="fa fa-long-arrow-left"></i><i class="fa fa-long-arrow-right"></i><i class="fa fa-long-arrow-up"></i><i class="fa fa-magic"></i><i class="fa fa-magnet"></i><i class="fa fa-male"></i><i class="fa fa-map-marker"></i><i class="fa fa-maxcdn"></i><i class="fa fa-meanpath"></i><i class="fa fa-medkit"></i><i class="fa fa-meh-o"></i><i class="fa fa-microphone"></i><i class="fa fa-microphone-slash"></i><i class="fa fa-minus"></i><i class="fa fa-minus-circle"></i><i class="fa fa-minus-square"></i><i class="fa fa-minus-square-o"></i><i class="fa fa-mobile"></i><i class="fa fa-money"></i><i class="fa fa-moon-o"></i><i class="fa fa-music"></i><i class="fa fa-newspaper-o"></i><i class="fa fa-openid"></i><i class="fa fa-outdent"></i><i class="fa fa-pagelines"></i><i class="fa fa-paint-brush"></i><i class="fa fa-paper-plane"></i><i class="fa fa-paper-plane-o"></i><i class="fa fa-paperclip"></i><i class="fa fa-paragraph"></i><i class="fa fa-pause"></i><i class="fa fa-paw"></i><i class="fa fa-paypal"></i><i class="fa fa-pencil"></i><i class="fa fa-pencil-square"></i><i class="fa fa-pencil-square-o"></i><i class="fa fa-phone"></i><i class="fa fa-phone-square"></i><i class="fa fa-picture-o"></i><i class="fa fa-pie-chart"></i><i class="fa fa-pied-piper"></i><i class="fa fa-pied-piper-alt"></i><i class="fa fa-pinterest"></i><i class="fa fa-pinterest-square"></i><i class="fa fa-plane"></i><i class="fa fa-play"></i><i class="fa fa-play-circle"></i><i class="fa fa-play-circle-o"></i><i class="fa fa-plug"></i><i class="fa fa-plus"></i><i class="fa fa-plus-circle"></i><i class="fa fa-plus-square"></i><i class="fa fa-plus-square-o"></i><i class="fa fa-power-off"></i><i class="fa fa-print"></i><i class="fa fa-puzzle-piece"></i><i class="fa fa-qq"></i><i class="fa fa-qrcode"></i><i class="fa fa-question"></i><i class="fa fa-question-circle"></i><i class="fa fa-quote-left"></i><i class="fa fa-quote-right"></i><i class="fa fa-random"></i><i class="fa fa-rebel"></i><i class="fa fa-recycle"></i><i class="fa fa-reddit"></i><i class="fa fa-reddit-square"></i><i class="fa fa-refresh"></i><i class="fa fa-renren"></i><i class="fa fa-repeat"></i><i class="fa fa-reply"></i><i class="fa fa-reply-all"></i><i class="fa fa-retweet"></i><i class="fa fa-road"></i><i class="fa fa-rocket"></i><i class="fa fa-rss"></i><i class="fa fa-rss-square"></i><i class="fa fa-rub"></i><i class="fa fa-scissors"></i><i class="fa fa-search"></i><i class="fa fa-search-minus"></i><i class="fa fa-search-plus"></i><i class="fa fa-share"></i><i class="fa fa-share-alt"></i><i class="fa fa-share-alt-square"></i><i class="fa fa-share-square"></i><i class="fa fa-share-square-o"></i><i class="fa fa-shield"></i><i class="fa fa-shopping-cart"></i><i class="fa fa-sign-in"></i><i class="fa fa-sign-out"></i><i class="fa fa-signal"></i><i class="fa fa-sitemap"></i><i class="fa fa-skype"></i><i class="fa fa-slack"></i><i class="fa fa-sliders"></i><i class="fa fa-slideshare"></i><i class="fa fa-smile-o"></i><i class="fa fa-sort"></i><i class="fa fa-sort-alpha-asc"></i><i class="fa fa-sort-alpha-desc"></i><i class="fa fa-sort-amount-asc"></i><i class="fa fa-sort-amount-desc"></i><i class="fa fa-sort-asc"></i><i class="fa fa-sort-desc"></i><i class="fa fa-sort-numeric-asc"></i><i class="fa fa-sort-numeric-desc"></i><i class="fa fa-soundcloud"></i><i class="fa fa-space-shuttle"></i><i class="fa fa-spinner"></i><i class="fa fa-spoon"></i><i class="fa fa-spotify"></i><i class="fa fa-square"></i><i class="fa fa-square-o"></i><i class="fa fa-stack-exchange"></i><i class="fa fa-stack-overflow"></i><i class="fa fa-star"></i><i class="fa fa-star-half"></i><i class="fa fa-star-half-o"></i><i class="fa fa-star-o"></i><i class="fa fa-steam"></i><i class="fa fa-steam-square"></i><i class="fa fa-step-backward"></i><i class="fa fa-step-forward"></i><i class="fa fa-stethoscope"></i><i class="fa fa-stop"></i><i class="fa fa-strikethrough"></i><i class="fa fa-stumbleupon"></i><i class="fa fa-stumbleupon-circle"></i><i class="fa fa-subscript"></i><i class="fa fa-suitcase"></i><i class="fa fa-sun-o"></i><i class="fa fa-superscript"></i><i class="fa fa-table"></i><i class="fa fa-tablet"></i><i class="fa fa-tachometer"></i><i class="fa fa-tag"></i><i class="fa fa-tags"></i><i class="fa fa-tasks"></i><i class="fa fa-taxi"></i><i class="fa fa-tencent-weibo"></i><i class="fa fa-terminal"></i><i class="fa fa-text-height"></i><i class="fa fa-text-width"></i><i class="fa fa-th"></i><i class="fa fa-th-large"></i><i class="fa fa-th-list"></i><i class="fa fa-thumb-tack"></i><i class="fa fa-thumbs-down"></i><i class="fa fa-thumbs-o-down"></i><i class="fa fa-thumbs-o-up"></i><i class="fa fa-thumbs-up"></i><i class="fa fa-ticket"></i><i class="fa fa-times"></i><i class="fa fa-times-circle"></i><i class="fa fa-times-circle-o"></i><i class="fa fa-tint"></i><i class="fa fa-toggle-off"></i><i class="fa fa-toggle-on"></i><i class="fa fa-trash"></i><i class="fa fa-trash-o"></i><i class="fa fa-tree"></i><i class="fa fa-trello"></i><i class="fa fa-trophy"></i><i class="fa fa-truck"></i><i class="fa fa-try"></i><i class="fa fa-tty"></i><i class="fa fa-tumblr"></i><i class="fa fa-tumblr-square"></i><i class="fa fa-twitch"></i><i class="fa fa-twitter"></i><i class="fa fa-twitter-square"></i><i class="fa fa-umbrella"></i><i class="fa fa-underline"></i><i class="fa fa-undo"></i><i class="fa fa-university"></i><i class="fa fa-unlock"></i><i class="fa fa-unlock-alt"></i><i class="fa fa-upload"></i><i class="fa fa-usd"></i><i class="fa fa-user"></i><i class="fa fa-user-md"></i><i class="fa fa-users"></i><i class="fa fa-video-camera"></i><i class="fa fa-vimeo-square"></i><i class="fa fa-vine"></i><i class="fa fa-vk"></i><i class="fa fa-volume-down"></i><i class="fa fa-volume-off"></i><i class="fa fa-volume-up"></i><i class="fa fa-weibo"></i><i class="fa fa-weixin"></i><i class="fa fa-wheelchair"></i><i class="fa fa-wifi"></i><i class="fa fa-windows"></i><i class="fa fa-wordpress"></i><i class="fa fa-wrench"></i><i class="fa fa-xing"></i><i class="fa fa-xing-square"></i><i class="fa fa-yahoo"></i><i class="fa fa-yelp"></i><i class="fa fa-youtube"></i><i class="fa fa-youtube-play"></i><i class="fa fa-youtube-square"></i>
	</div>
	<p class="help-block text-center">
		For a full list of icons, please consult:
		<a href="http://fortawesome.github.io/Font-Awesome/icons/">FontAwesome</a>
	</p>
</div>
								</div>
							</div>
						</div>
					</div>
					<hr />
					<div class="checkbox">
						<label>
							<input name="userTitleEnabled" type="checkbox"<!-- IF group.userTitleEnabled --> checked<!-- ENDIF group.userTitleEnabled-->> <strong>[[groups:details.userTitleEnabled]]</strong>
						</label>
					</div>
					<div class="checkbox">
						<label>
							<input name="private" type="checkbox"<!-- IF group.private --> checked<!-- ENDIF group.private-->> <strong>[[groups:details.private]]</strong>
							<p class="help-block">
								[[groups:details.private_help]]
							</p>
						</label>
					</div>
					<div class="checkbox">
						<label>
							<input name="hidden" type="checkbox"<!-- IF group.hidden --> checked<!-- ENDIF group.hidden-->> <strong>[[groups:details.hidden]]</strong>
							<p class="help-block">
								[[groups:details.hidden_help]]
							</p>
						</label>
					</div>

					<button class="btn btn-link btn-xs pull-right" type="button" data-action="delete">[[groups:details.delete_group]]</button>
					<button class="btn btn-primary" type="button" data-action="update">[[global:save_changes]]</button>
				</form>
			</div>
		</div>
		<!-- ENDIF group.isOwner -->

		<div>
			<!-- IF !posts.length -->
			<div class="alert alert-info">[[groups:details.has_no_posts]]</div>
			<!-- ENDIF !posts.length -->
<ul component="posts" class="posts-list" data-nextstart="{nextStart}">

	<!-- BEGIN posts -->
	<li component="post" class="posts-list-item" data-pid="{posts.pid}" data-uid="{posts.uid}">

		<div class="panel panel-default">
			<div class="panel-body">
				<a href="{config.relative_path}/user/{posts.user.userslug}">
					<img title="{posts.user.username}" class="img-rounded user-img" src="{posts.user.picture}">
				</a>

				<a href="{config.relative_path}/user/{posts.user.userslug}">
					<strong><span>{posts.user.username}</span></strong>
				</a>
				<div component="post/content" class="content">
					<p>{posts.content}</p>
					<p class="fade-out"></p>
				</div>
				<small>
					<span class="pull-right">
						[[global:posted_in_ago, <a href="{config.relative_path}/category/{posts.category.slug}"><i class="fa {posts.category.icon}"></i> {posts.category.name}</a>, <span class="timeago" title="{posts.relativeTime}"></span>]] &bull;
						<a href="{config.relative_path}/topic/{posts.topic.slug}/{posts.index}">[[global:read_more]]</a>
					</span>
				</small>
			</div>
		</div>

	</li>
	<!-- END posts -->
</ul>
<div component="posts/loading" class="loading-indicator text-center hidden">
	<i class="fa fa-refresh fa-spin"></i>
</div>
		</div>
		<div widget-area="right"></div>
	</div>
</div>
