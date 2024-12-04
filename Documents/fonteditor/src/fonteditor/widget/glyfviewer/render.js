/**
 * @file glyf列表渲染器
 * @author mengke01(kekee000@gmail.com)
 */

import glyf2svg from 'fonteditor-core/ttf/util/glyf2svg';
import string from 'common/string';
import i18n from '../../i18n/i18n';
const GLYF_ITEM_TPL = ''
    + '<div data-index="${index}" class="glyf-item ${compound} ${modify} ${selected} ${editing}">'
    +   '<i data-action="edit" class="ico i-edit" title="' + i18n.lang.edit + '"></i>'
    +   '<i data-action="del" class="ico i-del" title="' + i18n.lang.del + '"></i>'
    +   '<svg class="glyf" viewbox="0 0 ${unitsPerEm} ${unitsPerEm}">'
    +       '<g transform="scale(1, -1) translate(0, -${translateY}) scale(0.9, 0.9) ">'
    +           '<path class="path" ${fillColor} ${d}/></g>'
    +   '</svg>'
    +   '<div data-field="unicode" class="unicode" title="${unicode}">${unicode}</div>'
    +   '<div data-field="name" class="name" title="${name}">${name}</div>'
    + '</div>';

export default {

    /**
     * 获取glyf渲染列表项目
     *
     * @param  {Object} glyf glyf结构
     * @param  {Object} ttf  ttf字体结构
     * @param  {Object} opt  渲染参数
     * @return {string}      glyf列表项目片段
     */
    render(glyf, ttf, opt) {
        let g = {
            index: opt.index,
            compound: glyf.compound ? 'compound' : '',
            selected: opt.selected ? 'selected' : '',
            editing: opt.editing ? 'editing' : '',
            modify: glyf.modify,
            unitsPerEm: opt.unitsPerEm,
            translateY: opt.unitsPerEm + opt.descent,
            unicode: (glyf.unicode || []).map(function (u) {
                return '$' + u.toString(16).toUpperCase();
            }).join(','),
            name: string.encodeHTML(glyf.name || ''),
            fillColor: opt.color ? 'style="fill:' + opt.color + '"' : ''
        };

        let d = '';
        if ((d = glyf2svg(glyf, ttf))) {
            g.d = 'd="' + d + '"';
        }

        return string.format(GLYF_ITEM_TPL, g);
    }
};
