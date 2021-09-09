$().ready(function(){
    $table.bootstrapTable({
        toolbar: ".toolbar",
        showRefresh: true,
        search: true,
        showToggle: true,
        showColumns: true,
        pagination: true,
        striped: true,
        pageSize: 8,
        pageList: [8,10,25,50,100],

        formatShowingRows: function(pageFrom, pageTo, totalRows){
        },
        formatRecordsPerPage: function(pageNumber){
            return pageNumber + " rows visible";
        },
        icons: {
            refresh: 'fa fa-refresh',
            toggle: 'fa fa-th-list',
            columns: 'fa fa-columns',
            detailOpen: 'fa fa-plus-circle',
            detailClose: 'fa fa-minus-circle'
        }
    });



    $(window).resize(function () {
        $table.bootstrapTable('resetView');
    });


    window.operateEvents = {
        'click .remove': function (e, value, row, index) {
            $table.bootstrapTable('remove', {
                field: 'id',
                values: [row.id]
            });
        }
    };
});


function operateFormatter(value, row, index) {
    return [
        '<a rel="tooltip" title="Like" class="table-action like" href="javascript:void(0)" title="Like">',
        '<i class="fa fa-heart"></i>',
        '</a>',
        '<a rel="tooltip" title="Edit" class="table-action edit" href="javascript:void(0)" title="Edit">',
        '<i class="fa fa-edit"></i>',
        '</a>',
        '<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
        '<i class="fa fa-remove"></i>',
        '</a>'
    ].join('');
}

bubbly({
    colorStart: '#fff4e6',
    colorStop: '#ffe9e4',
    blur:1,
    compose: 'source-over',
    bubbleFunc:() => `hsla(${Math.random() * 50}, 100%, 50%, .3)`
});

