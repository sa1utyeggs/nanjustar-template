/**
 * 传递版title
 * @returns {string[]}
 */
export const transferTitles = () => {
    return ['显示', '隐藏'];
}

/**
 * 穿梭表单数据
 * @returns {[{disabled: number, value: number, key: string}, {disabled: number, value: number, key: string}]}
 */
export const transferData = () => {
    return [
        {
            key: '菜单名称',
            value: 1,
        },
        {
            key: '图标',
            value: 2,
        },
        {
            key: '排序',
            value: 3,
        },
        {
            key: '路由地址',
            value: 4,
        },
        {
            key: '组件名称',
            value: 5,
        },
        {
            key: '隐藏',
            value: 6,
        },
        {
            key: '禁用',
            value: 7,
        },
        {
            key: '创建人',
            value: 8,
        },
        {
            key: '创建时间',
            value: 9,
        },
        {
            key: '修改人',
            value: 10,
        },
        {
            key: '修改时间',
            value: 11,
        },
        {
            key: '备注信息',
            value: 12,
        },
    ];
}