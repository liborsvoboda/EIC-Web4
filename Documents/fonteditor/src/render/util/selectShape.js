/**
 * @file 从待选的shape中选择一个，作为选中的shape
 * @author mengke01(kekee000@gmail.com)
 */

import computeBoundingBox from 'graphics/computeBoundingBox';
import isPathCross from 'graphics/isPathCross';

/**
 * 从待选的shape中选择一个，作为选中的shape
 * @param {Array} shapes 路径集合
 * @param {Object} p 坐标点
 * @return {Object} selected shape
 */
export default function selectShape(shapes, p) {

    if (shapes.length === 1) {
        return shapes[0];
    }

    let sorted = shapes.map(function (shape) {
            let bound = computeBoundingBox.computePath(shape.points);
            shape._bound = bound;
            shape._size = bound.width * bound.height;
            return shape;
        })
        .sort(function (a, b) {
            return a._size - b._size;
        });

    let start = sorted[0];
    let end = sorted[sorted.length - 1];

    let result = isPathCross(
        start.points, end.points,
        start._bound, end._bound
    );

    let selection = start;

    if (2 === result) {
        selection = end;
    }
    else if (3 === result) {
        selection = start;
    }
    else {
        // 如果大小相等，则选择距离中心点远的
        if (p && Math.abs(start._size - end._size) / start._size  < 0.01) {
            let sx = start._bound.x + start._bound.width / 2;
            let sy = start._bound.y + start._bound.height / 2;
            let ex = end._bound.x + end._bound.width / 2;
            let ey = end._bound.y + end._bound.height / 2;
            if (
                Math.pow(p.x - ex, 2) + Math.pow(p.y - ey, 2)
                > Math.pow(p.x - sx, 2) + Math.pow(p.y - sy, 2)
            ) {
                selection = end;
            }
        }
    }

    shapes.forEach(function (shape) {
        delete shape._bound;
        delete shape._size;
    });

    return selection;
}
