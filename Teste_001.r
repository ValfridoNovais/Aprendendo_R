# Carregar pacotes
library(ggplot2)
library(dplyr)

# Meta até junho de 2024
meta_2024 <- data.frame(
  MES = c("jan", "fev", "mar", "abr", "mai", "jun"),
  IPQ = c(21.28, 42.55, 8.51, 46.81, 25.53, 34.04),
  IMV = c(2.00, 0.57, 3.15, 1.14, 1.14, 1.72)
)

# Resultados obtidos pelo 19 BPM até junho de 2024
resultados_2024 <- data.frame(
  MES = c("jan", "fev", "mar", "abr", "mai", "jun"),
  IPQ = c(106.38, 12.77, 29.79, 25.53, 38.3, 38.3),
  IMV = c(1.74, 0.29, 2.03, 3.19, 3.78, 3.19)
)

# Adicione uma coluna para indicar se é meta ou resultado
meta_2024$Tipo <- "Meta"
resultados_2024$Tipo <- "Resultado"

# Combine os data frames
dados <- rbind(meta_2024, resultados_2024)

# Ninebox plot
ggplot(dados, aes(x = IPQ, y = IMV, color = Tipo)) +
  geom_point(size = 3) +
  geom_smooth(method = "loess", se = FALSE) +
  geom_vline(xintercept = c(100, 200, 300), linetype = "dashed") +
  geom_hline(yintercept = c(1, 2, 3), linetype = "dashed") +
  scale_color_manual(values = c("Meta" = "red", "Resultado" = "blue")) +
  annotate("text", x = 250, y = 3.5, label = "Correlação: -0,29", size = 5, hjust = 0) +
  theme_minimal() +
  labs(title = "IMV x IPQ",
       subtitle = "Meta 2024 e Resultados 19 BPM até Junho de 2024",
       x = "IPQ",
       y = "IMV",
       caption = "Fonte: CGA/DOP - Base BISP auditada. Extração com dados até 01/05/2024")
