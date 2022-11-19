(function(){"use strict";var a=this,b=a.Chart,c=b.helpers,d={segmentShowStroke:!0,segmentStrokeColor:"#fff",segmentStrokeWidth:2,percentageInnerCutout:50,animationSteps:100,animationEasing:"easeOutBounce",animateRotate:!0,animateScale:!1,legendTemplate:'<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<segments.length; i++){%><li><span style="background-color:<%=segments[i].fillColor%>"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>'};b.Type.extend({name:"Doughnut",defaults:d,initialize:function(a){this.segments=[],this.outerRadius=(c.min([this.chart.width,this.chart.height])-this.options.segmentStrokeWidth/2)/2,this.SegmentArc=b.Arc.extend({ctx:this.chart.ctx,x:this.chart.width/2,y:this.chart.height/2}),this.options.showTooltips&&c.bindEvents(this,this.options.tooltipEvents,function(a){var b="mouseout"!==a.type?this.getSegmentsAtEvent(a):[];c.each(this.segments,function(a){a.restore(["fillColor"])}),c.each(b,function(a){a.fillColor=a.highlightColor}),this.showTooltip(b)}),this.calculateTotal(a),c.each(a,function(a,b){this.addData(a,b,!0)},this),this.render()},getSegmentsAtEvent:function(a){var b=[],d=c.getRelativePosition(a);return c.each(this.segments,function(a){a.inRange(d.x,d.y)&&b.push(a)},this),b},addData:function(a,b,c){var d=b||this.segments.length;this.segments.splice(d,0,new this.SegmentArc({value:a.value,outerRadius:this.options.animateScale?0:this.outerRadius,innerRadius:this.options.animateScale?0:this.outerRadius/100*this.options.percentageInnerCutout,fillColor:a.color,highlightColor:a.highlight||a.color,showStroke:this.options.segmentShowStroke,strokeWidth:this.options.segmentStrokeWidth,strokeColor:this.options.segmentStrokeColor,startAngle:1.5*Math.PI,circumference:this.options.animateRotate?0:this.calculateCircumference(a.value),label:a.label})),c||(this.reflow(),this.update())},calculateCircumference:function(a){return 2*Math.PI*(a/this.total)},calculateTotal:function(a){this.total=0,c.each(a,function(a){this.total+=a.value},this)},update:function(){this.calculateTotal(this.segments),c.each(this.activeElements,function(a){a.restore(["fillColor"])}),c.each(this.segments,function(a){a.save()}),this.render()},removeData:function(a){var b=c.isNumber(a)?a:this.segments.length-1;this.segments.splice(b,1),this.reflow(),this.update()},reflow:function(){c.extend(this.SegmentArc.prototype,{x:this.chart.width/2,y:this.chart.height/2}),this.outerRadius=(c.min([this.chart.width,this.chart.height])-this.options.segmentStrokeWidth/2)/2,c.each(this.segments,function(a){a.update({outerRadius:this.outerRadius,innerRadius:this.outerRadius/100*this.options.percentageInnerCutout})},this)},draw:function(a){var b=a?a:1;this.clear(),c.each(this.segments,function(a,c){a.transition({circumference:this.calculateCircumference(a.value),outerRadius:this.outerRadius,innerRadius:this.outerRadius/100*this.options.percentageInnerCutout},b),a.endAngle=a.startAngle+a.circumference,a.draw(),0===c&&(a.startAngle=1.5*Math.PI),c<this.segments.length-1&&(this.segments[c+1].startAngle=a.endAngle)},this)}}),b.types.Doughnut.extend({name:"Pie",defaults:c.merge(d,{percentageInnerCutout:0})})}).call(this);