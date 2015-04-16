'use strict';

angular.module('peApp').controller('doctorHomeCtrl',
		function($scope, $http, $location,$route) {

		});
angular.module('peApp').controller('fenjianCtrl',
		function($scope, $http, $location, fGateway,$route) {
			var gateway = new fGateway();
			gateway.call('getOffice.com').then(function(d) {
				if (d == 'error') {
					swal("Sorry!", "系统错误", "error");
				} else {
					$scope.offices = d;
				}
			});
			$scope.id = '';
			$scope.selected_physical_examination = [];
			$scope.getPhysicalExaminationsByOffice = function(office) {
				$scope.physicalExaminationOfThisOffice = [];
				gateway.call('getRegistrationList.com').then(function(d) {
					if (d == 'error') {
						swal("Sorry!", "系统错误", "error");
					} else {
						var physicalExaminations = d;
						physicalExaminations.forEach(function(value) {
							var physical_examination = JSON.parse(value.physical_examination);
							physical_examination.forEach(function(v) {
								if(v.office_name == office && _.indexOf($scope.physicalExaminationOfThisOffice, value) == -1 && !v.result){
									$scope.physicalExaminationOfThisOffice.push(value);
								}
							})
						})
					}
				})
			}
			$scope.selectChange = function() {
				$scope.getPhysicalExaminationsByOffice($scope.office.office_name);
			}
			
			$scope.show_physical_examination = function(id,physical_examination) {
				$scope.id = id;
				$scope.selected_physical_examination = JSON.parse(physical_examination);
				
			};			
			$scope.addComments = function(index,d){
				$scope.selected_physical_examination[index] = d;
				swal("Success!", "添加分检结果成功", "success");
			}
			$scope.submit = function(d){
				var physical_examination_result = JSON.stringify($scope.selected_physical_examination);
				gateway.call('tijiaofenjianjieguo.com',{
					id:$scope.id,
					physical_examination_result:physical_examination_result
				}).then(function(d) {
					if (d == 'error') {
						swal("Sorry!", "系统错误", "error");
					} else {
						swal("Success!", "保存分检结果成功", "success");
						$scope.getPhysicalExaminationsByOffice($scope.office.office_name);
					}
				});
			}
		});

angular.module('peApp').controller('zongjianCtrl',
		function($scope, $http, $location, fGateway,$route) {
			var gateway = new fGateway();
			$scope.id = '';
			$scope.getRegistrationLists = function() {
				$scope.registrationLists = [];
				gateway.call('getRegistrationList.com').then(function(d) {
					if (d == 'error') {
						swal("Sorry!", "系统错误", "error");
					} else {
						var registrationLists = d;
						registrationLists.forEach(function(value) {
							var physical_examination = JSON.parse(value.physical_examination);
							var isAllHaveResult = 1;
							physical_examination.forEach(function(v) {
								if(!v.result){
									console.log('1');
									isAllHaveResult = 0;
								}
							})
							if(isAllHaveResult && !value.comments){
								$scope.registrationLists.push(value);
							}
						})
					}
				})
			}
			
			$scope.getRegistrationLists();
			

			$scope.show_physical_examination = function(item) {
				$scope.id = item.id;
				$scope.comments = item.comments;
				$scope.selected_physical_examination = JSON.parse(item.physical_examination);
			};
			
			$scope.submit = function(comments){
				gateway.call('tijiaozongjianjieguo.com',{
					id:$scope.id,
					comments:comments
				}).then(function(d) {
					if (d == 'error') {
						swal("Sorry!", "系统错误", "error");
					} else {
						swal("Success!", "添加总检结果成功", "success");
						$scope.getPhysicalExaminationsByOffice($scope.office.office_name);
					}
				});
			}
		});