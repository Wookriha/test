library(treemap)
data("GNI2014")
class(GNI2014)
df <- GNI2014
treemap(df, 
        index = c("continent", "iso3"),
        vSize = "population",
        vColor = "GNI",
        type = "value",
        bg.labels = "yellow",
        title = "World's GNI")

head(state.x77)
st <- data.frame(state.x77)
symbols(x = st$Illiteracy, y = st$Murder,
        circles = st$Population,
        inches = 0.3,
        fg = "white",
        bg = "lightgray",
        xlab = "문맹율",
        ylab = "살인율",
        main = "문맹률 대비 살인율")
text(x = st$Illiteracy, y = st$Murder,
     labels = rownames(st),
     cex = 0.6,
     col = "brown")

mtcars
head(state.x77)
st1 <- data.frame(state.x77)
st1 <- data.frame(st1, stnames=rownames(st1))
treemap(st1,
        index = c("stnames"),
        vColor = "Income",
        vSize = "Area",
        type = "value",
        title = "지역별 면적 대비 수입",
        bg.labels = "yellow")

# 지역별 소방방재 시설과의 거리 및 도착시간
th <- read.csv("문화재청_중요목조문화재 방재 인적 인프라 현황.csv")
head(th)
sum(is.na(th))
th[is.na(th)] <- 0
city <- th[,2]
city.fac <- as.factor(city)
city.num <- as.numeric(city.fac)
th <- data.frame(th, city.num)

symbols(th$거리.KM., th$소방차도착시간.min.,
        circles = th$city.num,
        inches = 0.3,
        fg = "white",
        bg = th$city.num,
        xlab = "소방기관으로부터의 거리(km)",
        ylab = "도착예상 시간(min)",
        main = "지역별 소방방재 시설과의 거리 및 도착시간")
text(th$거리.KM., th$소방차도착시간.min.,
     labels = th$소재지.시도.,
     cex = 0.7,
     col = "black")

# 서울과 부산의 소방서 거리와 도착시간
th <- read.csv("문화재청_중요목조문화재 방재 인적 인프라 현황.csv")
th.new <- subset(th, th$소재지.시도. == "서울")
gu.fac <- as.factor(th.new[,3])
gu.num <- as.numeric(gu.fac)
th.new <- data.frame(th.new, gu.num)
th.new
symbols(th.new$거리.KM., th.new$소방차도착시간.min.,
        circles = th.new$gu.num,
        inches = 0.3,
        fg = "white",
        bg = th.new$gu.num,
        xlab = "소방기관으로부터의 거리(km)",
        ylab = "도착예상 시간(min)",
        main = "서울 내 소방방재 시설과의 거리 및 도착시간")
text(th.new$거리.KM., th.new$소방차도착시간.min.,
     labels = th.new$시군구,
     cex = 0.7,
     col = "black")
