 export const isMobile = (innerWidth = window.innerWidth) => {
  const isMobile = innerWidth <= 1024 ? true : false;
  return isMobile
}

export const filterRes = (res, key) => {
  let arr = Object.keys(res)
    .filter(item => item == key)
    .reduce((obj, key) => {
      obj = res[key]
      return obj
    }, [])
  return arr
}