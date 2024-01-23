
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N,M) = (input[0], input[1])

var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: M + 1)

var arr = [[Int]]()
for _ in 1...M {
    let values = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(values)
}

for i in 1...M {
    let day = arr[i - 1][0]
    let pages = arr[i - 1][1]

    for j in 1...N {
        dp[i][j] = dp[i - 1][j]
        if (j - day) >= 0 {
            dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - day] + pages)
        }
    }
}

print(dp[M][N])

