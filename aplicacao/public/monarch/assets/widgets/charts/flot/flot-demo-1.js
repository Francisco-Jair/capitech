$(function () {
    for (var a = [], b = [], c = 0; 354 > c; c += 31)a.push([c, Math.random(c)]), b.push([c, Math.random(c)]);
    var d = $.plot($("#data-example-1"), [{data: a, label: "Today"}, {
        data: b,
        label: "Yesterday"
    }], {
        series: {shadowSize: 0, lines: {show: !0, lineWidth: 2}, points: {show: !0}},
        grid: {labelMargin: 10, hoverable: !0, clickable: !0, borderWidth: 1, borderColor: "rgba(82, 167, 224, 0.06)"},
        legend: {backgroundColor: "#fff"},
        yaxis: {tickColor: "rgba(0, 0, 0, 0.06)", font: {color: "rgba(0, 0, 0, 0.4)"}},
        xaxis: {tickColor: "rgba(0, 0, 0, 0.06)", font: {color: "rgba(0, 0, 0, 0.4)"}},
        colors: [getUIColor("success"), getUIColor("gray")],
        tooltip: !0,
        tooltipOpts: {content: "x: %x, y: %y"}
    });
    $("#data-example-1").bind("plothover", function (a, b, c) {
        $("#x").text(b.x.toFixed(2)), $("#y").text(b.y.toFixed(2))
    }), $("#data-example-1").bind("plotclick", function (a, b, c) {
        c && ($("#clickdata").text("You clicked point " + c.dataIndex + " in " + c.series.label + "."), d.highlight(c.series, c.datapoint))
    })
}), $(function () {
    function a() {
        for (c.length > 0 && (c = c.slice(1)); c.length < d;) {
            var a = c.length > 0 ? c[c.length - 1] : 50, b = a + 10 * Math.random() - 5;
            0 > b ? b = 0 : b > 100 && (b = 100), c.push(b)
        }
        for (var e = [], f = 0; f < c.length; ++f)e.push([f, c[f]]);
        return e
    }

    function b() {
        f.setData([a()]), f.draw(), setTimeout(b, e)
    }

    var c = [], d = 300, e = 30, f = $.plot("#data-example-3", [a()], {
        series: {
            lines: {
                show: !0,
                lineWidth: 2,
                fill: .5,
                fillColor: {colors: [{opacity: .01}, {opacity: .08}]}
            }, shadowSize: 0
        },
        grid: {labelMargin: 10, hoverable: !0, clickable: !0, borderWidth: 1, borderColor: "rgba(82, 167, 224, 0.06)"},
        yaxis: {min: 0, max: 120, tickColor: "rgba(0, 0, 0, 0.06)", font: {color: "rgba(0, 0, 0, 0.4)"}},
        xaxis: {show: !1},
        colors: [getUIColor("default"), getUIColor("gray")]
    });
    b()
});