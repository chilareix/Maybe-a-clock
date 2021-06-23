int getSecondNumber(int n) {
  int m=n;
  if (m>=50)m-=10;
  if (m>=40)m-=10;
  if (m>=30)m-=10;
  if (m>=20)m-=10;
  if (m>=10)m-=10;
  return m;
}
int getFirstNumber(int n) {
  int m=n;
  while (m%10>0)m--;
  return m/10;
}
