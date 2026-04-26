# Power BI DAX Measures Library

## YTD Revenue
```dax
YTD Revenue =
CALCULATE(
    SUM(Sales[Revenue]),
    DATESYTD('Date'[Date])
)
```

## Month-over-Month Growth %
```dax
MoM Growth % =
VAR CurrentMonth = SUM(Sales[Revenue])
VAR PrevMonth =
    CALCULATE(
        SUM(Sales[Revenue]),
        DATEADD('Date'[Date], -1, MONTH)
    )
RETURN
DIVIDE(CurrentMonth - PrevMonth, PrevMonth, 0)
```

## Rolling 3-Month Average
```dax
Rolling 3M Avg =
AVERAGEX(
    DATESINPERIOD('Date'[Date], LASTDATE('Date'[Date]), -3, MONTH),
    [Total Revenue]
)
```

## Customer Lifetime Value
```dax
CLV =
SUMX(
    VALUES(Customer[CustomerID]),
    CALCULATE(SUM(Sales[Revenue])) *
    CALCULATE(DISTINCTCOUNT(Sales[OrderID]))
)
