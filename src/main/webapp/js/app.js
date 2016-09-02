(function() {
	'use strict';

	var app = angular.module('toolbarDemo1', [ 'ngMaterial' ]);

	app.controller('ToolBarCtrl', function($scope) {

	});

	app.controller('SideNavCtrl', function($scope, $timeout, $mdSidenav) {
		$scope.toggleLeft = buildToggler('left');
		$scope.toggleRight = buildToggler('right');

		function buildToggler(componentId) {
			return function() {
				$mdSidenav(componentId).toggle();
			}
		}
	});

	app.controller('InputProdTypeCtrl', function($q, $timeout) {
		var self = this;
		var pendingSearch, cancelSearch = angular.noop;
		var cachedQuery, lastSearch;
		self.allContacts = loadContacts();
		self.contacts = [ self.allContacts[0] ];
		self.asyncContacts = [];
		self.filterSelected = true;
		self.querySearch = querySearch;
		self.delayedQuerySearch = delayedQuerySearch;
		/**
		 * Search for contacts; use a random delay to simulate a remote call
		 */
		function querySearch(criteria) {
			cachedQuery = cachedQuery || criteria;
			return cachedQuery ? self.allContacts
					.filter(createFilterFor(cachedQuery)) : [];
		}
		/**
		 * Async search for contacts Also debounce the queries; since the
		 * md-contact-chips does not support this
		 */
		function delayedQuerySearch(criteria) {
			cachedQuery = criteria;
			if (!pendingSearch || !debounceSearch()) {
				cancelSearch();
				return pendingSearch = $q(function(resolve, reject) {
					// Simulate async search... (after debouncing)
					cancelSearch = reject;
					$timeout(function() {
						resolve(self.querySearch());
						refreshDebounce();
					}, Math.random() * 500, true)
				});
			}
			return pendingSearch;
		}

		function refreshDebounce() {
			lastSearch = 0;
			pendingSearch = null;
			cancelSearch = angular.noop;
		}
		/**
		 * Debounce if querying faster than 300ms
		 */
		function debounceSearch() {
			var now = new Date().getMilliseconds();
			lastSearch = lastSearch || now;
			return ((now - lastSearch) < 300);
		}
		/**
		 * Create filter function for a query string
		 */
		function createFilterFor(query) {
			var lowercaseQuery = angular.lowercase(query);
			return function filterFn(contact) {
				return (contact._lowername.indexOf(lowercaseQuery) != -1);
				;
			};
		}

		function loadContacts() {
			var contacts = [ 'Marina Augustine', 'Oddr Sarno',
					'Nick Giannopoulos', 'Narayana Garner', 'Anita Gros',
					'Megan Smith', 'Tsvetko Metzger', 'Hector Simek',
					'Some-guy withalongalastaname' ];
			return contacts.map(function(c, index) {
				var cParts = c.split(' ');
				var contact = {
					name : c,
					email : cParts[0][0].toLowerCase() + '.'
							+ cParts[1].toLowerCase() + '@example.com',
					image : 'http://lorempixel.com/50/50/people?' + index
				};
				contact._lowername = contact.name.toLowerCase();
				return contact;
			});
		}
	});

	app.controller('DialogController', function($scope, $mdDialog) {
		$scope.status = '  ';
		$scope.customFullscreen = false;
		$scope.showLoginDialog = function(ev) {
			$mdDialog.show({
				controller : DialogController,
				templateUrl : 'login.tmpl.html',
				parent : angular.element(document.body),
				targetEvent : ev,
				clickOutsideToClose : true
			}).then(
					function(answer) {
						$scope.status = 'You said the information was "'
								+ answer + '".';
					}, function() {
						$scope.status = 'You cancelled the dialog.';
					});
		};
		$scope.showSignUpDialog = function(ev) {
			$mdDialog.show({
				controller : DialogController,
				templateUrl : 'signup.tmpl.html',
				parent : angular.element(document.body),
				targetEvent : ev,
				clickOutsideToClose : true
			}).then(
					function(answer) {
						$scope.status = 'You said the information was "'
								+ answer + '".';
					}, function() {
						$scope.status = 'You cancelled the dialog.';
					});
		};

		function DialogController($scope, $mdDialog) {
			$scope.hide = function() {
				$mdDialog.hide();
			};
			$scope.cancel = function() {
				$mdDialog.cancel();
			};
			$scope.answer = function(answer) {
				$mdDialog.hide(answer);
			};
		}
	});

	app.controller('SignUpCtrl', function($scope) {
		$scope.project = {
			description : 'Nuclear Missile Defense System',
			rate : 500
		};
	});

	app.controller('DatePickerCtrl', function($scope) {
		$scope.myDate = new Date();
	});

	app.controller("AuthenticationCtrl", function($scope, $http, $location) {
			$scope.SendData = function() {
				// use $.param jQuery function to serialize data
				// from JSON
				console.log($scope.email);
				console.log($scope.password);

				$scope.errorText += ' EEEEEEError.';

				var data = $.param({
					email : $scope.email,
					password : $scope.password
				});

				console.log('Read ' + data);

				var config = {
					headers : {
						'Content-Type' : 'application/x-www-form-urlencoded;charset=utf-8;'
					}
				}

				$http.post('/EasyShopWay/Authentication.do', data, config)
					.success(function(data, status, headers, config) {
							console.log(data);
							if (data.emailErrMsg != undefined) {
								// $scope.emailError =
								// data.emailErrMsg;
								$scope.serverErrors = true;
							} else if (data.passwordErrMsg != undefined) {
								$scope.passwordError = data.passwordErrMsg;
							} else {
								$location.path("/EasyShopWay/HomePage.do");
							}
						}).error(
						function(data, status, header,
								config) {
							console.log('fail');
						});
			};
		});

})();