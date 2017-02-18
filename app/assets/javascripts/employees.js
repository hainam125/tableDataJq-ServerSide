$(document).ready(function() {
	(function() {
			
		var myTable = {
			init: function(table) {
				if (table.length > 0) {
					this.table = table;
					this.source = table.data('url');
					this.getColumns();
					this.getLanguage();
					this.getData();
				}
			},
			getLanguage: function() {
				//http://legacy.datatables.net/usage/i18n
				this.oLanguage = {
					'sProcessing': 	"Please Wait",
					'sInfoEmpty': 	"There is no data found"
				}
			},
			getColumns: function() {
				//http://legacy.datatables.net/usage/columns
				this.columns = [
					{
						'sTitle': 'No',
						'mData' : 'index',
						'sClass': 'text-center',
						'sWidth': '6%'
					},
					{
						'sTitle': 'First Name',
						'mData' : 'first_name',
						'sClass': 'text-center',
						'sWidth': '13%'
					},
					{
						'sTitle': 'Last Name',
						'mData' : 'last_name',
						'sClass': 'text-center',
						'sWidth': '14%'
					},
					{
						'sTitle': 'Birth',
						'mData' : 'birth',
						'sClass': 'text-center',
						'sWidth': '10%',
						'render': function(data) {
							time = new Date(data);
							return time.getDate() + "/" + (time.getMonth() + 1) + "/" + time.getFullYear();
						}
					},
					{
						'sTitle': 'Salary',
						'mData' : 'salary',
						'sClass': 'text-center',
						'sWidth': '10%'
					},
					{
						'sTitle': 'Exp',
						'mData' : 'experience',
						'sClass': 'text-center',
						'sWidth': '9%'
					},
					{
						'sTitle': 'Age',
						'mData' : 'age',
						'sClass': 'text-center',
						'sWidth': '9%',
						'orderable': false
					},
					{
						'sTitle': 'Onsite',
						'mData' : 'onsite',
						'sClass': 'text-center',
						'sWidth': '11%',
						'orderable': false
					}
				];
			},
			getData: function() {
				var self = this;
				$('#my-table').dataTable({
					'bLengthChange':  true,
					'bPaginate': 			true,
					'iDisplayLength': 10,
					'lengthMenu': 		[10,25,50,100,200],
					'language': {
						'lengthMenu':   '_MENU_'
					},
					'oLanguage': 			self.oLanguage,
					'bFilter':  			true,
					'bProcessing': 		true,
					'bServerSide': 		true,
					'sAjaxSource': 		self.source,
					'ordering': 			true,
					'order':					[[1, "asc"]],
					'aoColumns': 			self.columns,
					'fnServerData': function(sSource, aoData, fnCallback, oSettings) {
						var params = aoData.concat([{name: "first_name", value: "Nam"}, {name: "last_name", value: "Nguyen"}]);
						oSettings.jqXHR = $.ajax({
							'dataType': 'json',
							'url': sSource,
							'type': 'get',
							'data': params,
							"success": function(data){
								fnCallback(data);
			          setTimeout(function() {
			            console.log("after render");
			          }, 5000);
							}
						});
					}
				});		
			}
		}
		
		myTable.init($("#my-table"));	
	})();
});