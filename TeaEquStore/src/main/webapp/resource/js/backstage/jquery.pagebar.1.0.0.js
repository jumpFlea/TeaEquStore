/// <reference path="jquery.js"/>

/*
 * jpagebar
 * version: 1.0.0 (01/12/2009)
 * @ jQuery v1.3.*
 *
 * 
 * usage as:
 *     $.fn.jpagebar({ 
 *               //pagebar 对象div
 *               renderTo: $("#pagebarDiv2"),               
 *               //总页码
 *               totalpage: 10,
 *               //当前页码
 *               currentPage: 1,
 *               //分页条样式
 *               pagebarCssName: 'pagebar',  
 *               //页码样式
 *               pageNumberCssName:'page_number',
 *               //首页、Pre、Next、尾页样式
 *               pageNameCssName:'pageName',
 *               //选中首页、Pre或Next、尾页样式
 *               currentPageNameCssName:'current_pageName',
 *               //当前选中页码样式
 *               currentPageNumberCssName:'current_page_number',
 *               //显示总页码样式
 *               totalpageNumberCssName:'totalpage_number',  
 *               //点击页码action
 *               onClickPage : function(pageIndex){
 *                               //重新定义jpagebar的显示
 *                               $.fn.setCurrentPage(this,pageIndex);
 *                               //用户其他操作在这里
 *                               //...
 *                           }
 *   });     
 * Copyright 2009 LYM [ lym6520@qq.com ] 
 */
(function($) {
    $.extend($.fn, {
        jpagebar : function(setting) {
            var pb = $.extend({
                // pagebar 对象div
                renderTo : $(document.body),
                // 总页码
                totalpage : 0,
                // 当前页码
                currentPage : 0,
                // 分页条样式
                pagebarCssName : 'pagebar',
                // 页码样式
                pageNumberCssName : 'page_number',
                // 首页、Pre、Next、尾页样式
                pageNameCssName : 'pageName',
                // 选中首页、Pre或Next、尾页样式
                currentPageNameCssName : 'current_pageName',
                // 当前选中页码样式
                currentPageNumberCssName : 'current_page_number',
                // 显示总页码样式
                totalpageNumberCssName : 'totalpage_number',
                // 显示总数据条数
                totalResultsCssName : 'totalResults_number',
                // 点击页码action
                onClickPage : function(pageIndex) {

                }
            }, setting);

            pb.resetPagebar = function() {
                var _this = this;
                _this.renderTo = (typeof _this.renderTo == 'string' ? $(_this.renderTo) : _this.renderTo);

                /*
                 * ----------> html : <div> ---->pagebar <a>首页</a> <a>Pre</a> <a>&nbsp;</a>... ----> 显示页码 <a>Next</a> <a>尾页</a> <span class="show_page_detail"> ---->显示信息 <span
                 * class="current_page">currentpage</span> ----> 显示当前页码 <span>/</span> <span class="total_page">totalpage</span> ----> 显示总页码 </span> </div> <-----------
                 */
                var pagebar = _this.renderTo;
                pagebar.attr('class', _this.pagebarCssName);

                // 清空分页导航条
                pagebar.empty();

                if (totalpage = 0) {
                    return;
                }
                // 分页
                var front_block = parseInt(_this.currentPage) - 4;// 当前页码前面一截,原来是5
                var back_block = parseInt(_this.currentPage) + 4;// 当前页码后面一截,原来是5
                $('<span>当前'+_this.currentPage+'</span> ').attr('class',_this.currentPageNumberCssName).appendTo(pagebar);
                $('<span>/</span>').appendTo(pagebar);
                $('<span>共'+_this.totalpage+'页</span> ').attr('class',_this.totalpageNumberCssName).appendTo(pagebar);
                $('<span>  &nbsp;&nbsp;&nbsp;共'+_this.totalResults+'条数据</span> ').attr('class',_this.totalResultsCssName).appendTo(pagebar);
                $("<span>  &nbsp;&nbsp;&nbsp;跳到第 <input type='number' id='changePage'  class='input-text' value='"+_this.currentPage+"' style='width:50px;height:27px;'> 页</span> " ).attr('class',_this.totalpageNumberCssName).appendTo(pagebar);
                $('<a>GO</a>  ').attr('class', _this.totalpageNumberCssName).bind("click", function() {
                    _this.onClickPage($("#changePage").val());
                }).appendTo(pagebar);
                pagebar.find("a").attr('class',_this.pageNumberCssName);
                // 处理首页、Pre
                if (_this.currentPage == 1) {
                    // 当前页为第一页
                   // $('<a>首页</a> ').attr('class', _this.pageNameCssName + ' ' + _this.currentPageNameCssName).appendTo(pagebar);
                    $('<a>上一页</a> ').attr('class', _this.pageNameCssName + ' ' + _this.currentPageNameCssName).appendTo(pagebar);

                }
                else {
                    // 当前页大于第一页
                    //$('<a>首页</a> ').attr('class', _this.pageNameCssName).bind("click", function() {
                    //    _this.onClickPage(1);
                  //  }).appendTo(pagebar);
                    $('<a>上一页</a> ').attr('class', _this.pageNameCssName).bind("click", function() {
                        _this.onClickPage(_this.currentPage - 1);
                    }).appendTo(pagebar);
                }

                // 处理数字页码

                if (_this.totalpage == 1) {
                    // 共1页
                    $('<a>1</a> ').attr('class', _this.currentPageNumberCssName).bind("click", function() {
                        _this.onClickPage(1);
                    }).appendTo(_this.renderTo);
                }
                else {
                    // 有多页
                    var tempBack_block = _this.totalpage;
                    var tempFront_block = 1;
                    if (back_block < _this.totalpage)
                        tempBack_block = back_block;
                    if (front_block > 1)
                        tempFront_block = front_block;

                    for ( var i = tempFront_block; i <= tempBack_block; i++) {
                        if (_this.currentPage == i) {
                            // 当前页
                            $('<a>' + i + '</a> ').attr('class', _this.pageNumberCssName + ' ' + _this.currentPageNumberCssName).appendTo(pagebar);
                        }
                        else {
                            $('<a>' + i + '</a> ').attr('class', _this.pageNumberCssName).bind("click", function() {
                                _this.onClickPage(this.innerHTML);
                            }).appendTo(pagebar);

                        }
                    }
                }

                // Next, 尾页 处理
                if (_this.currentPage == _this.totalpage) {
                    // 当前页为最后一页
                    $('<a>下一页</a> ').attr('class', _this.pageNameCssName + ' ' + _this.currentPageNameCssName).appendTo(pagebar);
                   // $('<a>尾页</a> ').attr('class', _this.pageNameCssName + ' ' + _this.currentPageNameCssName).appendTo(pagebar);
                }
                else {
                    $('<a>下一页</a> ').attr('class', _this.pageNameCssName).bind("click", function() {
                        _this.onClickPage(parseInt(_this.currentPage) + 1);
                    }).appendTo(pagebar);
                    //$('<a>尾页</a> ').attr('class', _this.pageNameCssName).bind("click", function() {
                   //     _this.onClickPage(_this.totalpage);
                   // }).appendTo(pagebar);
                }

                // 红色字体显示当前页
                /*$('<span>共'+_this.totalpage+'页</span> ').attr('class',_this.totalpageNumberCssName).appendTo(pagebar);*/
                 
            };
            pb.resetPagebar();
            return pb;
        },
        setCurrentPage : function(_this, currentPage) {
            _this.currentPage = currentPage;
            _this.resetPagebar(_this);
        },
        getCurrentPage:function(_this) {
            return _this.currentPage;
        },
        setTotalPage : function(_this, totalpage) {
            _this.totalpage = totalpage;
            _this.resetPagebar(_this);
        }

    });
})(jQuery);
