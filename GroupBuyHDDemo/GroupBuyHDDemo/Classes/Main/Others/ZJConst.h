// 自定义Log
#ifdef  DEBUG
#define ZJLog(...) NSLog(@"%s %d \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ZJLog(...)
#endif


#define ZJColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ZJRandomColor ZJColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))
#define ZJGlobalBgColor ZJColor(230,230,230)
