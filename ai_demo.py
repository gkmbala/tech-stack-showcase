import openai
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression

client = openai.OpenAI()

def ask_ai(prompt: str) -> str:
    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[{"role": "user", "content": prompt}]
    )
    return response.choices[0].message.content

def predict_sales(data: list) -> np.ndarray:
    df = pd.DataFrame(data, columns=["month", "sales"])
    X = df[["month"]]
    y = df["sales"]
    model = LinearRegression().fit(X, y)
    future = np.array([[13], [14], [15]])
    return model.predict(future)

if __name__ == "__main__":
    result = ask_ai("Summarise AI trends in 2025 in 3 bullet points")
    print(result)
    sample = [(i, i * 120 + np.random.randint(0, 50)) for i in range(1, 13)]
    print("Next 3 months forecast:", predict_sales(sample))
