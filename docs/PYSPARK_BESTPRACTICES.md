# PySpark Best Practices

From **Andrew Ray** (Spark Contributer)

- Use built-in functions of `spark.sql.functions` (they are much faster: note all behind-the-scene calculations are done in Java)

- **Important**: Use the same version of Python and packages on cluster and driver (can use conda env)

- Check-out the Spark UI at http://localhost:4040

- SSH port forwarding: run on cluster and have a  jupyter notebook: connection via SSH

- Try not to iterate through rows (same in Pandas)

- Filter then convert to pandas: `df.head().toPandas()` NOT ~~`df.toPandas().head()`~~ 
