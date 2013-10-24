(function(a){
    a.fn.webwidget_vertical_menu1=function(p){
        var p=p||{};

        var f=p&&p.menu_text_size?p.menu_text_size:"12";
        var g=p&&p.menu_text_color?p.menu_text_color:"";
        var h=p&&p.menu_border_size?p.menu_border_size:"1";
        var i=p&&p.menu_background_color?p.menu_background_color:"#FFF";
        var j=p&&p.menu_border_color?p.menu_border_color:"blue";
        var k=p&&p.menu_border_style?p.menu_border_style:"solid";
        var l=p&&p.menu_width?p.menu_width:"250";
        var n=p&&p.menu_height?p.menu_height:"30";
        var r=p&&p.menu_margin?p.menu_margin:"5";
        var v=p&&p.menu_background_hover_color?p.menu_background_hover_color:"red";
        var m=p&&p.directory?p.directory:"catalog/view/theme/default/image";
        var w=a(this);
        f += 'px';
        h += 'px';
        l += 'px';
        n += 'px';
        r += 'px';
        if(w.children("ul").length==0||w.find("li").length==0){
            dom.append("Require menu content");
            return null
        }
        init();
        function init(){
            w.children("ul").find("a").css("color",g).css("font-size",f).css("line-height",n).css("display","block");
            w.children("ul").children("li").css("border",h+" "+k+" "+j).css("margin-bottom",r).css("background-color",i);
            w.find("li").children("ul").css("border",h+" "+k+" "+j).css("background-color",i);
            w.find("li").css("width",l).css("height",n);
            w.find("li:has(ul)").addClass("webwidget_vertical_menu_down_drop1");
            w.find("li:has(ul)").css("background-image","url("+m+"/arrow-left.png)");
            w.children("ul").children("li").find("ul").css("right",l).css("top","0px");
        }

        w.find("li").hover(function(){
            $(this).css("background-color",v);
            $(this).children("ul").show()
            },function(){
            $(this).css("background-color",i);
            $(this).children("ul").hide()
            });

            function s_u_t(a){
            l_t_b_s=a.outerHeight(true)-a.css("border-top-width").replace("px","")*2+"px";
            a.children("ul").css("top",l_t_b_s);
            a.children("ul").css("right","-"+a.css("border-top-width"));
            li_hieght = w.children("ul").children("li").outerHeight(true);
            a.children("ul").find("a").css("line-height",li_hieght+"px");
            }
            function s_sub_l(a,b){
            boder_width=b.replace("px","");
            a.css("right",a.parent("li").parent("ul").outerWidth(true)-boder_width*2);
            a.css("top","-"+b)
            }
        }
})(jQuery);