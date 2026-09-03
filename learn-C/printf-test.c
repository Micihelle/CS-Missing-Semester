#include <stdio.h>

int main(void) {
    int num = 42;
    int width = 5;

    // 普通用法，按顺序使用参数
    // 打印结果: "num = 42, width = 5"
    printf("num = %d, width = %d\n", num, width);

    // 显式指定参数位置：
    // %1$d 表示使用第1个参数，即 num
    // %2$d 表示使用第2个参数，即 width
    // 打印结果: "width = 5, num = 42"
    printf("width = %2$d, num = %1$d\n", num, width);

    // 使用动态字段宽度和位置参数：
    // 在格式说明符 %2$*1$d 中：
    // - *1$ 指定字段宽度使用第1个参数（即 width）
    // - %2$d 指定打印第2个参数（即 num）
    // 打印结果: "num with width:    42"（42 前面填充了空格，总宽度为5）
    printf("num with width: %2$*1$d\n", width, num);

    return 0;
}

