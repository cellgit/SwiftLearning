//
//  BasicPromiseViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/2/20.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit
import PromiseKit

class BasicPromiseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
//        setupBasic()
//        setupBasicSimple()
//        setupCatch()
//        setupFinally()
//        setupMap()
//        setupGet()
//        setupTap()
//        setupWhen()
//        setupRace()
        setupGuarantee()
//        setupAfter()
    }
    
    /// 1. then()、done() 方法
    func setupBasic() {
        _ = cook()
            .then { data -> Promise<String> in
                return self.eat(data: data)
            }.then { data -> Promise<String> in
                return self.wash(data: data)
            }.done { data in
                print(data)
        }
    }
    
    func setupBasicSimple() {
        _ = cook()
            .then(eat)
            .then(wash)
            .done { data in
                print(data)
        }
    }

    /// 2. catch() 方法
    func setupCatch() {
        //链式调用
        _ = cookCatch()
            .then(eatCatch)
            .done { data in
                print(data)
            }.catch{ error in
                print(error.localizedDescription + "没法吃!")
        }
    }
    
    
    
    /// 3. finally() 方法:
    ///在我们执行完 then，或者处理完 error 之后，还有一些操作（比如关闭活动指示器），那么就可以放到 finally 里面去执行。也就是说不管前面是 fulfill 还是 reject，最终都会进入到 finally 方法里来。
    func setupFinally() {
        //链式调用
        _ = cookCatch()
            .then(eatCatch)
            .done { data in
                print(data)
            }.catch{ error in
                print(error.localizedDescription + "没法吃!")
            }.finally {
                print("出门上班")
        }
    }
    
    /* 4. map()、compactMap() 方法
     then() 方法要求输入一个 promise 值并返回一个 promise，而 map() 是根据先前 promise 的结果，然后返回一个新的对象或值类型。
     compactMap() 与 map() 类似，不过它是返回 Optional。比如我们返回 nil，则整个链会产生 PMKError.compactMap 错误。
     */
    func setupMap() {
        //链式调用
        _ = cook()
            .map({ data -> String in
                return data + "，配上一碗汤"
            })
            .then(eat)
            .done { data in
                print(data)
        }
    }
    
//    func setupCompactMap() {
//        _ = fetchData()
//            .compactMap {
//                try JSONSerialization.jsonObject($0.data) as? [String]
//            }
//            .done { arrayOfStrings in
//                //…
//            }
//            .catch { error in
//                // Foundation.JSONError if JSON was badly formed
//                // PMKError.compactMap if JSON was of different type
//        }
//    }
    
    /* 5，get()、tap() 方法
     如果想要在链路中获取值用于其他操作，比如输出调试。那么可以使用 get()、tap() 这两个方法，它们都不会影响到原有链路逻辑。
     */
    /// 1）get() 方法只有前面是完成状态（fulfilled）时才会调用，它得到的是具体结果对象：
    func setupGet() {
        _ = cook()
            .get{ data in
                print("---> \(data)")
            }
            .then(eat)
            .then(wash)
            .done {data in
                print(data)
        }
    }
    
    /// （2）tap() 方法是不管前面是完成（fulfilled）还是失败（rejected）都会调用，同时它得到的是 Result<T>：
    func setupTap() {
        _ = cook()
            .tap{ result in
                print("---> \(result)")
            }
            .then(eat)
            .done { data in
                print(data)
            }.catch{ error in
                print(error.localizedDescription + "没法吃!")
        }
    }
    
    
    /* 6，when() 方法
     when 方法提供了并行执行异步操作的能力，并且只有在所有异步操作执行完后才执行回调。
     和其他的 promise 链一样，when 方法中任一异步操作发生错误，都会进入到下一个 catch 方法中。
     */
    /// （1）比如下面代码，两个异步操作是并行执行的，等到它们都执行完后才会进到 done 里面。同时 when 会把所有异步操作的结果传给 done。
    func setupWhen() {
        //链式调用
        _ = when(fulfilled: cutUpWhen(), boilWhen())
            .done{ result1, result2 in
                print("结果：\(result1)、\(result2)")
        }
    }
    
    /* 7，race() 方法
     race 按字面解释，就是赛跑的意思。race 的用法与 when 一样，只不过 when 是等所有异步操作都执行完毕后才执行 then 回调。而 race 的话只要有一个异步操作执行完毕，就立刻执行 then 回调。
     要注意的是，其它没有执行完毕的异步操作仍然会继续执行，而不是停止。
     */
    ///（1）这里我们将上面样例的 when 改成 race
    func setupRace() {
        //链式调用
        _ = race(cutUpWhen(), boilWhen())
            .done{ data in
                print("结果：\(data)")
        }
    }
    
    /* 8，Guarantee
     Guarantee 是 Promise 的变种、或者补充，其用法和 Promise 一样，大多情况下二者可以互相替换使用。
     与 Promise 状态可以是成功或者失败不同，Guarantee 要确保永不失败，因此语法也更简单些。
     */
    ///（1）这里我们将第一个样例中的 Promise 使用 Guarantee 替换：
    func setupGuarantee() {
        //链式调用
        _ = cook()
            .then(eat)
            .then(wash)
            .done { data in
                print(data)
        }
    }
    
    /* 9，after() 方法
     想要代码延迟一段时间执行，我们前面都是使用 DispatchQueue 创建延时队列来实现。其实 PromiseKit 已经为我们封装好了 after 这个延迟执行方法。
     */
    func setupAfter() {
        //延迟5秒执行
        after(seconds: 5).done {
            print("欢迎访问hangge.com")
        }
    }
    
}

extension BasicPromiseViewController {
    //做饭
    func cook() -> Promise<String> {
        print("开始做饭。")
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("做饭完毕！")
                resolver.fulfill("鸡蛋炒饭")
            }
        }
        return p
    }
    
    //吃饭
    func eat(data:String) -> Promise<String> {
        print("开始吃饭：" + data)
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("吃饭完毕！")
                resolver.fulfill("一块碗和一双筷子")
            }
        }
        return p
    }
    
    //洗碗
    func wash(data:String) -> Promise<String> {
        print("开始洗碗：" + data)
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("洗碗完毕！")
                resolver.fulfill("干净的碗筷")
            }
        }
        return p
    }
}

extension BasicPromiseViewController {
    //做饭Catch
    func cookCatch() -> Promise<String> {
        print("开始做饭。")
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("做饭失败！")
                let error = NSError(domain:"PromiseKitTutorial", code: 0,
                                    userInfo: [NSLocalizedDescriptionKey: "烧焦的米饭"])
                resolver.reject(error)
            }
        }
        return p
    }
    
    //吃饭Catch
    func eatCatch(data:String) -> Promise<String> {
        print("开始吃饭：" + data)
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("吃饭完毕！")
                resolver.fulfill("一块碗和一双筷子")
            }
        }
        return p
    }
}


extension BasicPromiseViewController {
    //做饭
    func cookMap() -> Promise<String> {
        print("开始做饭。")
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("做饭完毕！")
                resolver.fulfill("鸡蛋炒饭")
            }
        }
        return p
    }
    
    //吃饭
    func eatMap(data:String) -> Promise<String> {
        print("开始吃饭：" + data)
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("吃饭完毕！")
                resolver.fulfill("一块碗和一双筷子")
            }
        }
        return p
    }
}

extension BasicPromiseViewController{
    //切菜
    func cutUpWhen() -> Promise<String> {
        print("开始切菜。")
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟2秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                print("切菜完毕！")
                resolver.fulfill("切好的菜")
            }
        }
        return p
    }
    
    //烧水
    func boilWhen() -> Promise<String> {
        print("开始烧水。")
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("烧水完毕！")
                resolver.fulfill("烧好的水")
            }
        }
        return p
    }
}
