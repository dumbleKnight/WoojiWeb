
function init_select(select_id, options, values, default_id) {
    var us = document.getElementById(select_id);
    for (i=0; i<options.length; i++) {
        var u = document.createElement('option');
        u.text = options[i];
        u.value = values[i];
        if (i==default_id) { u.selected = true; }
        us.options.add(u);
    }
};

function search_blog(symbol) {
    
};

function get_treemap_color(ret) {
    var cpos = [100, 200, 100];
    var c0   = [240, 240, 240];
    var cneg = [250, 100, 100];
    var scale = 5;

    if (ret > 0) {
        var r = c0[0] + (cpos[0]-c0[0])*Math.min(1, ret/scale);
        var g = c0[1] + (cpos[1]-c0[1])*Math.min(1, ret/scale);
        var b = c0[2] + (cpos[2]-c0[2])*Math.min(1, ret/scale);
    } else {
        var r = c0[0] + (cneg[0]-c0[0])*Math.min(1, -ret/scale);
        var g = c0[1] + (cneg[1]-c0[1])*Math.min(1, -ret/scale);
        var b = c0[2] + (cneg[2]-c0[2])*Math.min(1, -ret/scale);
    }
    return "#"+Math.round(r).toString(16)+Math.round(g).toString(16)+Math.round(b).toString(16);
};


function highlightme(item, evt, tooltipid, symbol, term, pred_rate) {
    var tooltip = document.getElementById(tooltipid);
    var info = get_info(symbol, term, pred_rate);
    var cell = item.getElementsByTagName('rect');
    cell[0].style.stroke = "#55d";
    cell[0].style["stroke-width"] = 3;
    tooltip.innerHTML = info;
    tooltip.style.display = "block";
    tooltip.style.left = evt.pageX + 10 + 'px';
    tooltip.style.top = evt.pageY + 10 + 'px';
};

function unhighlightme(item, tooltipid) {
    var cell = item.getElementsByTagName('rect');
    cell[0].style["stroke-width"] = 0;
    var tooltip = document.getElementById(tooltipid);
    tooltip.style.display = "none";
};

function get_info(symbol, term, pred_rate) {
    var info = "<p>"+term+" prediction of <span style='font-weight:bold;'>"+symbol + '</span></p>';
    info = info + '<p>Wooji rate: ';
    if (pred_rate > 0) {
        var star = '\u2B06'.repeat(Math.abs(pred_rate));
        info += "<span style='color:#3a3;'>"+star+"</span></p>";
    } else {
        var star = '\u2B07'.repeat(Math.abs(pred_rate));
        info += "<span style='color:#f33;'>"+star+"</span></p>";
    }
    info += "<p>Customer rate: </p>";
    return info;
};

function draw_treemap(tmarray, treemapid, predtermid, tooltipid) {
    var tm = document.getElementById(treemapid);
    var term = document.getElementById(predtermid);
    tm.innerHTML = "";
    for (i=0; i<tmarray.length; i++) {   
        for (i=0; i<tmarray.length; i++) {
            var c = get_treemap_color(tmarray[i][5]);
            var text = '<text font-weight="bold" text-anchor="middle" dominant-baseline="central" x='+ 
               (tmarray[i][1]+tmarray[i][3]/2)+' y='+(tmarray[i][2]+tmarray[i][4]/2)+'>'+tmarray[i][0]+'</text>';
           
            var cell = '<g onmousemove="highlightme(this, evt,\''+tooltipid+'\', \''+tmarray[i][0]+
                '\', \''+term.value+'\', '+tmarray[i][5]+')" '+
                'onmouseout="unhighlightme(this,\''+tooltipid+'\')"><a href="'+tmarray[i][0]+'">'+ 
                '<rect x='+tmarray[i][1]+' y='+tmarray[i][2]+' rx=0 ry=0 width='+ 
                tmarray[i][3]+' height='+tmarray[i][4]+' style="fill:'+c+';" />'
                + text +'</a></g>';
            tm.innerHTML += cell;
        }
    }    
};

function d3_draw_treemap(tmarray, treemapid, predtermid, tooltipid) {
    var term = document.getElementById(predtermid);
    var node_name = "#" + treemapid;
    var groups = d3.select(node_name)
                 .selectAll("g")
                 .data(tmarray)
                 .enter()
                 .append("g");
    
    groups.append("rect")
          .attr("x",function(d){ return d[1]; })
          .attr("y",function(d){ return d[2]; })
          .attr("rx",0)
          .attr("ry",0)
          .attr("width",function(d){ return d[3]; })
          .attr("height",function(d) {return d[4]; })
          .attr("style",function(d) { return "fill:" + get_treemap_color(d[5]); });
    
    groups.append("text")
          .attr("font-wight","bold")
          .attr("x",function(d){ return (d[1] + d[3] / 2) ; })
          .attr("y",function(d){ return (d[2] + d[4] / 2); })
          .text(function(d){ return d[0]; })
          .attr("text-anchor","middle")
          .attr("dominant-baseline","central");

    groups.on("click",function(d){
        window.open(d[0],"_self");
    });

    groups.on("mousemove",function(d,highlightme){
        var cell = this.getElementsByTagName('rect');
        cell[0].style.stroke = "#55d";
        cell[0].style["stroke-width"] = 3;
        var tool_tip = document.getElementById(tooltipid);
        var info = get_info(d[0], term.value, d[5]);
        tool_tip.innerHTML = info;
        tool_tip.style.display = "block";
        tool_tip.style.left = event.pageX + 10 + 'px';
        tool_tip.style.top = event.pageY + 10 + 'px';
    });

    groups.on("mouseout",function(d,unhighlightme){
        var cell = this.getElementsByTagName('rect');
        cell[0].style["stroke-width"] = 0;
        var tool_tip = document.getElementById(tooltipid);
        tool_tip.style.display = "none";
    })
    
        
}

function show_top_table(tmarray, toptableid, predtermid) {
    var table = document.getElementById(toptableid);
    var term = document.getElementById(predtermid);
    table.innerHTML = "";

    var gain = [];
    var loss = [];
    for (i=0; i<tmarray.length; i++) {
        if (tmarray[i][5] > 0) {
            var star = '\u2B06'.repeat(Math.abs(tmarray[i][5]));
            gain.push([tmarray[i][0], "<span style='color:#3a3;'>"+star+"</span>"]);
        } else {
            var star = '\u2B07'.repeat(Math.abs(tmarray[i][5]));
            loss.push([tmarray[i][0], "<span style='color:#f33;'>"+star+"</span>"]);
        }
    }
    
    var titles = [term.value + ' Top Gain', term.value+' Top Loss'];
    var titles2 = ['Symbol', 'Wooji Rate', 'Customer Rate', 'Symbol', 'Wooji Rate', 'Customer Rate'];
    var titlebgcolors = ['#dfd', '#fdd'];
    var contentbgcolors = ['#efe', '#fee'];

    var row = document.createElement("TR");
    for (i=0; i<2; i++) {
        var cell = document.createElement("TD");
        cell.colSpan = 3;
        cell.appendChild(document.createTextNode(titles[i]));
        row.appendChild(cell);
    }
    table.appendChild(row);

    var row = document.createElement("TR");
    for (i=0; i<6; i++) {
        var cell = document.createElement("TD");
        cell.appendChild(document.createTextNode(titles2[i]));
        row.appendChild(cell);
    }
    table.appendChild(row);

    for (i=0; i<Math.max(gain.length, loss.length); i++) {
        var row  = document.createElement("TR");
        
        var cell = document.createElement("TD");
        if (i<gain.length) {
            //cell.appendChild(document.createTextNode(gain[i][0]));
            cell.innerHTML = "<a href='"+gain[i][0]+"'>"+gain[i][0]+"</a>";
        }
        row.appendChild(cell);

        var cell = document.createElement("TD");
        if (i<gain.length) {
            cell.innerHTML = gain[i][1];
        }
        row.appendChild(cell);

        var cell = document.createElement("TD");
        row.appendChild(cell);

        var cell = document.createElement("TD");
        if (i<loss.length) {
            //cell.appendChild(document.createTextNode(loss[i][0]));
            cell.innerHTML = "<a href='"+loss[i][0]+"'>"+loss[i][0]+"</a>";
        }
        row.appendChild(cell);

        var cell = document.createElement("TD");
        if (i<loss.length) {
            cell.innerHTML = loss[i][1];
        }
        row.appendChild(cell);

        var cell = document.createElement("TD");
        row.appendChild(cell);


        table.appendChild(row);
    }
    
};

function draw_box(svg, x1,y1,x2,y2, fillcolor) {
    svg.append("rect")
         .attr("x", x1)
         .attr("y", y1)
         .attr("width", x2-x1)
         .attr("height", y2-y1)
         .attr("stroke-width", 1)
         .attr("stroke", "#555")
         .attr("fill", fillcolor);

};

function draw_ygrid(svg, x1,x2,ys) {
    for (i=0; i<ys.length; i++) {
        svg.append("line")
            .attr("x1", x1)
            .attr("y1", ys[i])
            .attr("x2", x2)
            .attr("y2", ys[i])
            .attr("stroke", "#aaa")
            .attr("stroke-width", 1)
            .attr("stroke-dasharray", "5,5");
    }
};

function get_ygrid(pmin, pmax, ymin, ymax) {
    var nbin = 9;
    var grids = [0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 1,2,5,10,20,50,100,200,500,1000];
    var dp = (pmax-pmin)/nbin;
    var dy = (ymax-ymin)/nbin;
    var pgrid = [];
    var ygrid = [];

    for (i=0; i<grids.length; i++) {
        if (grids[i] >= dp) {
            dp = grids[i];
            break;
        }
    }
    var p0 = Math.floor(pmin/dp) * dp;
    for (i=1; i<=nbin; i++) {
        if (p0+i*dp < pmax) { 
            pgrid.push(p0+i*dp);
            ygrid.push(ymax - (p0+i*dp-pmin)/(pmax-pmin)*(ymax-ymin));
        }
    }
    return [pgrid, ygrid];
};

function get_xgrid(tarray, xmin, xmax) {
    var nbin = 4;
    var d = Math.floor((tarray.length-1)/(nbin-1));
    var tgrid = [];
    var xgrid = [];

    for (i=0; i<nbin; i++) {
        tgrid.push(tarray[tarray.length-1-i*d]);
        xgrid.push(xmin + (tarray.length-1-i*d)/(tarray.length-1)*(xmax-xmin));
    }

    for (i=0; i<tgrid.length-1; i++) {
        if (tgrid[i].substring(0,4) == tgrid[i+1].substring(0,4)) {
            tgrid[i] = tgrid[i].substring(5,tgrid[i].length);
        }
    }
    return [tgrid, xgrid];
};

function draw_ytick(svg, pgrid, ygrid, x) {
    for (i=0; i<pgrid.length; i++) {
        svg.append("text")
            .attr("x", x-5)
            .attr("y", ygrid[i])
            .attr("text-anchor", "end")
            .attr("dominant-baseline", "central")
            .text(Math.round(pgrid[i]*100)/100);
    }

};

function draw_xtick(svg, tgrid, xgrid, y) {
    for (i=0; i<tgrid.length; i++) {
        svg.append("line")
            .attr("stroke", "black")
            .attr("stroke-width", 1)
            .attr("x1", xgrid[i])
            .attr("y1", y)
            .attr("x2", xgrid[i])
            .attr("y2", y+5);

        svg.append("text")
            .attr("x", xgrid[i])
            .attr("y", y+5)
            .attr("text-anchor", "middle")
            .attr("dominant-baseline", "hanging")
            .text(tgrid[i]);
    }
};

function draw_hoverboxes(svg, symbol, pdate, popen, phigh, plow, pclose, pvolume, pmktcap, 
    xmin, xmax, ymin, ymax, tooltipid) {
    
    // info: [symbol, date, open, high, low, close, volume, mktcap]
    var tooltip = document.getElementById(tooltipid);
    
    var pmin = Math.min(...pclose);
    var pmax = Math.max(...pclose);
    var boxes = [];
    var text = '<g class="hoverboxes">';

    var dx = (xmax-xmin)/(pclose.length-1);

    boxes.push([xmin, dx*0.5, xmin, ymax-(pclose[0]-pmin)/(pmax-pmin)*(ymax-ymin)]);
    for (i=1; i<pclose.length-1; i++) {
        boxes.push([xmin+dx*(i-0.5), dx, xmin+dx*i, ymax-(pclose[i]-pmin)/(pmax-pmin)*(ymax-ymin)]);
    }
    boxes.push([xmax-dx*0.5, dx*0.5, xmax, ymax-(pclose[pclose.length-1]-pmin)/(pmax-pmin)*(ymax-ymin)]);

    for (i=0; i<pclose.length; i++) {
        var allinfo = [[boxes[i][2], boxes[i][3], symbol, pdate[i], popen[i], phigh[i], plow[i], pclose[i], pvolume[i], pmktcap[i]]];
        var g = svg.append("g");

        g.data(allinfo).enter();

        var line = g.append("line")
            .attr("x1", boxes[i][2])
            .attr("y1", ymin)
            .attr("x2", boxes[i][2])
            .attr("y2", ymax)
            .attr("stroke", "blue")
            .attr("stroke-dasharray", "5,5")
            .attr("stroke-width", 1)
            .attr("display", "none");
        var cc = g.append("circle")
            .attr("cx", boxes[i][2])
            .attr("cy", boxes[i][3])
            .attr("r", 5)
            .attr("fill", "blue")
            .attr("display", "none");
        var rec = g.append("rect")
            .attr("x", boxes[i][0])
            .attr("y", ymin)
            .attr("width", boxes[i][1])
            .attr("height", ymax-ymin)
            .attr("fill-opacity", 0);
        
        g.on("mouseover", function(d, i) {
                d3.select(this).select("line")
                    .attr("display", "block");
                d3.select(this).select("circle")
                    .attr("display", "block");
                
                tooltip.innerHTML = "<p><strong>"+d[2]+'</strong> @ ('+d[3]+")</p>"+
                    "<p>Open: "+d[4]+"</p>"+
                    "<p>High: "+d[5]+"</p>"+
                    "<p>Low: "+d[6]+"</p>"+
                    "<p>Close: "+d[7]+"</p>"+
                    "<p>Volume: "+d[8]+"</p>"+
                    "<p>Market Capital: "+d[9]+"</p>";
                tooltip.style.display = "block";
                tooltip.style.opacity = 1.0;
                tooltip.style.left = d[0] + 30 + 'px';
                tooltip.style.top = d[1] + 'px';
        })

        .on("mouseout", function() {
            d3.select(this).select("line")
                .attr("display", "none");    
            d3.select(this).select("circle")
                .attr("display", "none"); 
            tooltip.style.display = "none";
        });
        
    }
};


function show_daily_price_tip(info, tooltipid) {
                // info: [symbol, date, open, high, low, close, volume, mktcap]
                var tooltip = document.getElementById(tooltipid);
                g = d3.select(this);
                line = g.select("line");
                cc = g.select("circle");
                line.style["stroke-width"] = 1;
                cc.style.display = "block";
                tooltip.innerHTML = "<p><strong>"+info[0]+'</strong> @ ('+info[1]+")</p>"+
                    "<p>Open: "+info[2]+"</p>"+
                    "<p>High: "+info[3]+"</p>"+
                    "<p>Low: "+info[4]+"</p>"+
                    "<p>Close: "+info[5]+"</p>"+
                    "<p>Volume: "+info[6]+"</p>"+
                    "<p>Market Capital: "+info[7]+"</p>";
                tooltip.style.display = "block";
                tooltip.style.left = x + 30 + 'px';
                tooltip.style.top = y + 'px';
            }


function draw_pclose(svg, pclose, xmin, xmax, ymin, ymax) {
    var pmin = Math.min(...pclose);
    var pmax = Math.max(...pclose);
    var xy = [];
    
    if (pclose[0] < pclose[pclose.length-1]) {
        var linecolor = "#4b4";
    } else if (pclose[0] > pclose[pclose.length-1]) {
        var linecolor = "#f44";
    } else {
        var linecolor = "#44f";
    }

    var dx = (xmax-xmin)/(pclose.length-1);

    for (i=0; i<pclose.length; i++) {
        xy.push({'x':xmin+dx*i, 'y':ymax-(pclose[i]-pmin)/(pmax-pmin)*(ymax-ymin)});
    }

    var linefunction = d3.svg.line()
                            .x(function(d) { return d.x; })
                            .y(function(d) { return d.y; })
                            .interpolate("linear");

    svg.append("path")
        .attr("d", linefunction(xy))
        .attr("stroke", linecolor)
        .attr("stroke-width", 2)
        .attr("fill", "none");
};

function draw_volume(svg, popen, pclose, volume, xmin, xmax, ymin, ymax) {
    var vmin = Math.min(...volume);
    var vmax = Math.max(...volume);

    var text = '<g class="volume">';
    var bar = [];
    var dx = (xmax-xmin)/(volume.length-1);

    if (pclose[0] > popen[0]) {
        var c = '#4d4';
    } else {
        var c = '#f44';
    }
    bar.push([xmin, xmin+dx*0.5, (volume[0]-vmin)/(vmax-vmin)*(ymax-ymin), c]);
    for (i=1; i<volume.length-1; i++) {
        if (pclose[i] > popen[i]) {
            var c = '#4d4';
        } else {
            var c = '#f44';
        }
        bar.push([xmin+dx*(i-0.5), xmin+dx*(i+0.5), (volume[i]-vmin)/(vmax-vmin)*(ymax-ymin), c]);
    }
    if (pclose[volume.length-1] > popen[volume.length-1]) {
        var c = '#4d4';
    } else {
        var c = '#f44';
    }
    bar.push([xmin+dx*(volume.length-1-0.5), xmax, (volume[volume.length-1]-vmin)/(vmax-vmin)*(ymax-ymin), c]);


    for (i=0; i<volume.length; i++) {

        svg.append("rect")
            .attr("x", bar[i][0])
            .attr("y", ymax-bar[i][2])
            .attr("width", bar[i][1]-bar[i][0])
            .attr("height", bar[i][2])
            .attr("fill", bar[i][3])
            .attr("fill-opacity", 0.3);
    }

}


function draw_prediction(svg, term, rate, xmin, xmax, ymin, ymax) {
    if (rate > 0) {
        var ratecolor = "#3a3";
        var arrow = "\u2B06".repeat(Math.abs(rate));
    } else {
        var ratecolor = "#f33";
        var arrow = "\u2B07".repeat(Math.abs(rate));
    }

    svg.append("rect")
        .attr("x", xmin)
        .attr("y", ymin)
        .attr("width", xmax-xmin)
        .attr("height", 40)
        .attr("fill", "#ccf")
        .attr("stroke-width", 1)
        .attr("stroke", "black");

    svg.append("text")
        .attr("x", (xmin+xmax)/2)
        .attr("y", ymin+12)
        .attr("text-anchor", "middle")
        .attr("dominant-baseline", "central")
        .attr("font-weight", "bold")
        .text(term+'-term');
    
    svg.append("text")
        .attr("x", (xmin+xmax)/2)
        .attr("y", ymin+12+16)
        .attr("text-anchor", "middle")
        .attr("dominant-baseline", "central")
        .attr("font-weight", "bold")
        .text('prediction');

    svg.append("text")
        .attr("x", (xmin+xmax)/2)
        .attr("y", (ymin+ymax)/2-5)
        .attr("text-anchor", "middle")
        .attr("dominant-baseline", "baseline")
        .text("wooji rate");

    svg.append("text")
        .attr("x", (xmin+xmax)/2)
        .attr("y", (ymin+ymax)/2+5)
        .attr("text-anchor", "middle")
        .attr("dominant-baseline", "hanging")
        .text(arrow)
        .style("fill", ratecolor);

    svg.append("text")
        .attr("x", (xmin+xmax)/2 )
        .attr("y", ymax - 50)
        .attr("text-anchor", "middle")
        .attr("dominant-baseline", "baseline")
        .text("customer rate");
}

function show_prediction_table( table_id, rates ) {
    var table = document.getElementById(table_id);
    table.innerHTML = '';
    var heads = ['Short term', 'Middle term', 'Long term'];
    var row = document.createElement("TR");
    for (i=0; i<3; i++) {
        var cell =document.createElement("TD");
        cell.innerHTML = heads[i];
        row.appendChild(cell);
    }
    table.appendChild(row);

    var row = document.createElement("TR");
    for (i=0; i<3; i++) {
        var cell =document.createElement("TD");
        if (rates[i] > 0) {
            cell.innerHTML = "<font color='#3a3'>" + "\u2B06".repeat(Math.abs(rates[i])) + "</font>";
        } else {
            cell.innerHTML = "<font color='#f33'>" + "\u2B07".repeat(Math.abs(rates[i])) + "</font>";
        }
        row.appendChild(cell);
    }
    table.appendChild(row);    
}

function draw_timeseries(svgid, tooltipid, histprice, nday, svgh, svgw) {
    var left_margin = 40;
    var bottom_margin = 20;
    var right_margin = 20;
    var top_margin = 5;

    //var svg = document.getElementById(svgid);

    var svg = d3.select("#"+svgid);

    //var svgh = ts.height.baseVal.value;
    //var svgw = ts.width.baseVal.value;
    //var histxmax = (svgw - right_margin - left_margin) * 0.618 + left_margin;
    var histxmax = svgw - right_margin;

    var istart = Math.max(0, histprice.close.length-nday);
    var symbol = histprice.symbol[0];
    var volume = histprice.volume.slice(istart, histprice.close.length);
    var mktcap = histprice.mktcap.slice(istart, histprice.close.length);
    var popen = histprice.open.slice(istart, histprice.close.length);
    var phigh = histprice.high.slice(istart, histprice.close.length);
    var plow = histprice.low.slice(istart, histprice.close.length);
    var pclose = histprice.close.slice(istart, histprice.close.length);
    var pdate = histprice.date.slice(istart, histprice.close.length);
    var ytick = get_ygrid(Math.min(...pclose), Math.max(...pclose), top_margin, svgh-bottom_margin);
    var xtick = get_xgrid(pdate, left_margin, histxmax);
    //var predx1 = (svgw-right_margin - histxmax)/3 + histxmax;
    //var predx2 = (svgw-right_margin - histxmax)*2/3 + histxmax;

    draw_box(svg, left_margin, top_margin, svgw-right_margin, svgh-bottom_margin, "none");
    //draw_box(svg, histxmax, top_margin, svgw-right_margin, svgh-bottom_margin, "#eef");
    //draw_box(svg, predx1, top_margin, predx2, svgh-bottom_margin, "none");
    draw_ygrid(svg, left_margin, histxmax, ytick[1]);
    draw_ytick(svg, ytick[0], ytick[1], left_margin);
    draw_xtick(svg, xtick[0], xtick[1], svgh-bottom_margin);
    draw_pclose(svg, pclose, left_margin, histxmax, top_margin, svgh-bottom_margin);
    draw_volume(svg, popen, pclose, volume, left_margin, histxmax, svgh-bottom_margin-100, svgh-bottom_margin);
    //draw_prediction(svg, 'Short', rates[0], histxmax, predx1, top_margin, svgh-bottom_margin );
    //draw_prediction(svg, 'Medium', rates[1], predx1, predx2, top_margin, svgh-bottom_margin );
    //draw_prediction(svg, 'Long', rates[2], predx2, svgw-right_margin, top_margin, svgh-bottom_margin );
    draw_hoverboxes(svg, symbol, pdate, popen, phigh, plow, pclose, volume, mktcap,
            left_margin, histxmax, top_margin, svgh-bottom_margin, tooltipid);

};


